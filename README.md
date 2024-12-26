# Docker SOCKS5 Proxy

Данный репозиторий позволит с минимальными затратами запустить свой собственный socks5 proxy-сервер.

## Quickstart

Ниже приведена инструкция по подъему SOCKS5 прокси.

1. Установите Docker engine.
   
   Выберите инструкцию для вашей ОС. Тестирование всей системы проводилось только для Ubuntu, но для других ОС все также должно работать с некоторыми модификациями приведенных ниже команд.
 
   1. [Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce)
   2. [Mac](https://docs.docker.com/docker-for-mac/install/)
   3. [Windows](https://docs.docker.com/docker-for-windows/install/)
   
2. Склонируйте данный репозиторий

   ```bash
   git clone https://github.com/vanitoo/docker-socks5.git
   cd docker-socks5
   ```

3. Запуск через docker-compose.yml
   Запускаем Docker-образ:
   ```bash
   sudo docker compose up -d
   ```
   
4. Запуск через Dockerfile
   Собираем и запускам образ
   ```bash
   sudo docker build -t socks5 .
   sudo docker run -d -p 1080:1080 socks5
   ```

5. Если вы хотите использовать логин/пароль для своего прокси, то надо также добавить файл конфигурации в Docker-контейнер, что делается добавлением опции при запуске:
   
   ```bash
   sudo docker run -d -p 1080:1080 -v ${PWD}/sockd.conf:/etc/sockd.conf socks5
   ```
  
6. Проверка
   без пароля
   ```bash
   curl --proxy socks5://localhost:1081 https://2ip.ru
   ```
   с паролем
   ```bash
   curl --proxy socks5://myuser:mypassword@localhost:1081 https://2ip.ru
   ```
   
7. Ваш прокси-сервер готов!

