# ใช้ image ของ Go ที่เป็น official base image
FROM golang:1.20-alpine

# กำหนด directory ที่ใช้ภายใน container
WORKDIR /app

# คัดลอก go.mod และ go.sum และติดตั้ง dependency
COPY go.mod go.sum ./
RUN go mod tidy

# คัดลอกไฟล์ทั้งหมดไปที่ container
COPY . .

# สร้างแอปพลิเคชัน
RUN go build -o go-rest-api .

# เปิดพอร์ต 8080 สำหรับแอปพลิเคชัน
EXPOSE 8080

# รันแอปพลิเคชัน
CMD ["./go-rest-api"]
