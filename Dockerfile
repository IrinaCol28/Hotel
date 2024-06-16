# Используем базовый образ с установленной Maven и Java
FROM maven:3.8.4-openjdk-11-slim AS build

# Устанавливаем директорию приложения
WORKDIR /app

# Копируем файлы сборки Maven и выполняем сборку проекта
COPY . .
RUN mvn clean package

# Используем другой базовый образ для выполнения
FROM openjdk:11-jre-slim

# Устанавливаем директорию приложения
WORKDIR /app

# Копируем JAR-файл из предыдущего этапа сборки
COPY --from=build /app/target/buysell-0.0.1-SNAPSHOT.jar /app/app.jar

# Устанавливаем переменную среды для указания настройки Spring для использования H2
ENV SPRING_PROFILES_ACTIVE h2

# Экспонируем порт, на котором работает приложение
EXPOSE 8080

# Команда для запуска приложения
CMD ["java", "-jar", "app.jar"]