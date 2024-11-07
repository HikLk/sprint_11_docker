# Используем базовый образ с предустановленным Go
FROM golang:1.22.2

# Указываем рабочую директорию
WORKDIR /app

# Копируем необходимые файлы
COPY go.mod go.sum ./
COPY main.go parcel.go parcel_test.go ./
COPY tracker.db ./

# Устанавливаем зависимости
RUN go mod download

# Собираем приложение
RUN go build -o /app/main .

# Запускаем контейнер с приложением
CMD ["/app/main"]