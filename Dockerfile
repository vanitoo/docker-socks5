FROM wernight/dante

# Используем аргументы для задания переменных окружения
ARG USER
ARG PASS

# Устанавливаем переменные окружения для использования в RUN команде
ENV USER ${USER}
ENV PASS ${PASS}

# Добавляем пользователя с указанными аргументами
RUN printf "${PASS}\n${PASS}\n" | adduser ${USER}
