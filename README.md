# Docker SOCKS5 Proxy

Данный репозиторий позволит с минимальными затратами запустить свой собственный socks5 proxy-сервер.

## Quickstart

Ниже приведена инструкция по подъему SOCKS5 прокси.
Единственное требование - наличие [белого](https://help.keenetic.net/hc/ru/articles/213965789-В-чем-отличие-белого-и-серого-IP-адреса-) IP. 

1. Установите Docker engine.
   
   Выберите инструкцию для вашей ОС. Тестирование всей системы проводилось только для Ubuntu, но для других ОС все также должно работать с некоторыми модификациями приведенных ниже команд.
 
   1. [Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce)
   2. [Mac](https://docs.docker.com/docker-for-mac/install/)
   3. [Windows](https://docs.docker.com/docker-for-windows/install/)
   
2. Склонируйте данный репозиторий

   ```bash
   git clone https://github.com/elejke/docker-socks5.git
   cd docker-socks5
   ```
   
3. Соберите Docker-образ

   ```bash
   sudo docker build -t socks5 .
   ```
   
   Если вы хотите использовать логин и пароль для своего сервера, то исправьте соответствующую строчку в [Dockerfile](Dockerfile#L4) на желаемую пару логин/пароль.
   
4. Запустите Docker-образ:

   ```bash
   sudo docker run -d -p 1080:1080 socks5
   ```
   Если вы хотите использовать логин/пароль для своего прокси, то надо также добавить файл конфигурации в Docker-контейнер, что делается добавлением опции при запуске:
   
   ```bash
   sudo docker run -d -p 1080:1080 -v ${PWD}/sockd.conf:/etc/sockd.conf socks5
   ```
   
   При этом будут использованы логин/пароль указанные на шаге 3.
   
5. Ваш прокси-сервер готов!

