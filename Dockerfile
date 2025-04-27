# Используем образ с Java и Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Устанавливаем Chrome и необходимые зависимости
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    sudo dpkg -i google-chrome-stable_current_amd64.deb && \

# Копируем исходный код
WORKDIR /app
COPY pom.xml .
COPY src ./src

# Собираем проект
RUN mvn clean package

# Запускаем тесты (можно изменить на `mvn test` для только тестов)
CMD ["mvn test", "verify"]
