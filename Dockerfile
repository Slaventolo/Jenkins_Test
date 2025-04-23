# Используем образ с Java и Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Устанавливаем Chrome и необходимые зависимости
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

# Копируем исходный код
WORKDIR /app
COPY pom.xml .
COPY src ./src

# Собираем проект
RUN mvn clean package

# Запускаем тесты (можно изменить на `mvn test` для только тестов)
CMD ["mvn test", "verify"]
