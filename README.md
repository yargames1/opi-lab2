## Лабораторная работа #2

Сконфигурировать в своём домашнем каталоге репозитории svn и git и загрузить в них начальную ревизию файлов с исходными кодами (в соответствии с выданным вариантом).

![variant](assets/variant.png)

Воспроизвести последовательность команд для систем контроля версий __svn__ и __git__, осуществляющих операции над исходным кодом, приведённые на блок-схеме.

При составлении последовательности команд необходимо учитывать следующие условия:
- Цвет элементов схемы указывает на пользователя, совершившего действие (красный - первый, синий - второй).
- Цифры над узлами - номер ревизии. Ревизии создаются последовательно.
- Необходимо разрешать конфликты между версиями, если они возникают.

### Как запускать:

```sh main.sh <version-control> <main-branch-name> <force-mode> <repository-directory> <working-directory>```
- ```<version-control>``` - specified versions control system - __git__ / __svn__
- ```<main-branch-name>``` - name of default main branch
- ```<force-mode>``` - 0 for auto merge, 1 to merge manually 
- ```<repository-directory>``` - path to repo's dir, relative to main.sh script
- ```<working-directory>``` - path to working dir (for _git_ same as repo's dir), relative to main.sh script

### То, что уже реализовано

Git:
- init - инициализация репозитория
- new-branch - создание новой ветки
- set-user - установка текущего пользователя
- commit - создание коммита
- merge - слияние веток

Svn:
- init - инициализация репозитория
- new-branch - создание новой ветки
- set-user - установка текущего пользователя
- commit - создание коммита
- merge - слияние веток

### Что надо реализовать:
- интерактивный запуск с выбором параметров