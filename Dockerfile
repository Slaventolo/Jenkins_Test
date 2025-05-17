# Ubuntu
FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y sudo

# Устанавливаем Chrome
RUN sudo apt update && \
    sudo apt upgrade &&\
    sudo apt install curl software-properties-common apt-transport-https ca-certificates -y && \
    curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg > /dev/null && \
    echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list && \
    sudo apt update && \
    sudo apt install google-chrome-stable

# Устновка jdk 21
RUN sudo apt update && \
    sudo apt install openjdk-21-jdk

# Устанавливаем Maven
RUN apt install maven && \


# Копируем исходный код
WORKDIR /app
COPY pom.xml .
COPY src ./src

# Собираем проект
RUN mvn clean package

# Запускаем тесты (можно изменить на `mvn test` для только тестов)
CMD ["mvn test", "verify"]
