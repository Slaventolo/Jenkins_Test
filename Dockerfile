# Используем образ с Java и Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Устанавливаем Chrome и необходимые зависимости
RUN sudo apt update && \
    sudo apt upgrade &&\
    sudo apt install curl software-properties-common apt-transport-https ca-certificates -y&& \
    curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg > /dev/null && \
    echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list && \
    sudo apt update && \
    sudo apt install google-chrome-stable

# Копируем исходный код
WORKDIR /app
COPY pom.xml .
COPY src ./src

# Собираем проект
RUN mvn clean package

# Запускаем тесты (можно изменить на `mvn test` для только тестов)
CMD ["mvn test", "verify"]
