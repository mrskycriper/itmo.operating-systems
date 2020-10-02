## Инструкция по загрузке лабораторных работ на GitHub    
1) Заходим в систему под пользователем **root** с паролем **rootroot**
2) Ставим GitHub на виртуальную машину   
        `yum install git`
3) Проверяем что он установился при помощи  
        `git --version`
4) Выходим из системы при помощи `exit` и заходим под обычным пользователем   
5) Конфигурируем имя пользователя и почту от GitHub   
        `git config --global user.name "your_user_name"`  
        `git config --global user.email "your_user_email"`
6) Создаем папку для репозитория и переходим в нее  
        `mkdir /home/user/*folder_name*`  
        `cd /home/user/*folder_name*`  
7) Инициализируем репозиторий  
        `git init`  
8) Создаем репозиторий на GitHub через сайт и добавляем README.md  
9) Копируем файлы лабораторной в папку  
        `cp path_to_original_file path_to_file_copy`  
10) Проверяем наличие изменений  
        `git status`  
10) Добавляем новые/измененные файлы в commit  
        `git add file_name`  
11) Проверяем что загрузили все изменения в commit  
        `git status`  
12) Делаем commit  
        `git commit -m "your_commit_text"`  
13) Привязываемся к репозиторию и верифицируем его  
        `git remote add origin https://github.com/*your_user_name*/*your_repository_name*.git`  
        `git remote -v`  
14) Загружаем изменения на сервер, тут от вас попросят логин и пароль от GitHub. Не пугайтесь, символы пароля не появляются в строке  
        `git push -u origin master`  
15) Готово, файлы появятся в ветке **master** на сайте  
