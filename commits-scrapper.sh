#!/usr/bin/env bash
set -euo pipefail

variant="${1:-}"
first_commit="${2:-0}"
last_commit="${3:-1}"

if [[ -z "$variant" ]]; then
  echo "Usage: $0 VARIANT" >&2
  exit 1
fi

mkdir -p ./output

base_url='https://se.ifmo.ru/courses/software-engineering-basics?p_p_id=selab2_WAR_seportlet&p_p_lifecycle=2&p_p_state=normal&p_p_mode=view&p_p_cacheability=cacheLevelPage'

for commit in $(seq "${first_commit}" "${last_commit}"); do
  zip_file="./output/commit${commit}.zip"
  extract_dir="./output/r${commit}"

  mkdir -p "$extract_dir"

  curl -sS --fail "$base_url" \
    -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
    -H 'accept-language: ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7' \
    -H 'cache-control: max-age=0' \
    -H 'content-type: application/x-www-form-urlencoded' \
    -H 'origin: https://se.ifmo.ru' \
    -H 'referer: https://se.ifmo.ru/courses/software-engineering-basics' \
    -H 'user-agent: Mozilla/5.0' \
    --data-raw "variant=${variant}&commit=${commit}" \
    -o "$zip_file"

  unzip -o "$zip_file" -d "$extract_dir" >/dev/null
  rm -f "$zip_file"

  echo "saved and extracted $extract_dir"
done