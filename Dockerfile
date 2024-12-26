FROM wernight/dante

# Копируем конфиг для Dante
COPY sockd.conf /etc/sockd.conf

# Создаём пользователя с паролем
ARG USERNAME=myUser
ARG PASSWORD=myPassword
ARG USE_PASSWORD=false


# Создаем пользователя с паролем или без, в зависимости от значения USE_PASSWORD
RUN if [ "$USE_PASSWORD" = "true" ]; then \
        adduser --disabled-password --gecos "" $USERNAME && \
        echo "$USERNAME:$PASSWORD" | chpasswd; \
    else \
        adduser --disabled-password --gecos "" $USERNAME; \
    fi


# Открываем порт для SOCKS5
EXPOSE 1080

# Запускаем Dante
CMD ["sockd", "-f", "/etc/sockd.conf"]
