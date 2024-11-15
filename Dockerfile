# Используем базовый образ (например, Alpine для легковесного контейнера)
FROM alpine:latest

# Создаем рабочую директорию "app"
WORKDIR /app

# Устанавливаем имя контейнера
LABEL name="fishing (5th copy)"

# Пустой командный файл или конечная команда для контейнера
CMD ["echo", "Container fishing (5th copy) with /app directory created"]