FROM wernight/dante

# Используем аргумент сборки для имени пользователя
ARG USERNAME=john

# Создаем пользователя без пароля
RUN adduser --disabled-password --gecos "" $USERNAME
