# استخدم صورة تحتوي على Java 8 مسبقاً
FROM openjdk:8-jdk-slim

# ثبّت curl و Node.js
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

# حدد مجلد العمل
WORKDIR /app

# انسخ ملفات المشروع
COPY . .

# ثبّت اعتماديات Node.js
RUN npm install

# المنفذ الذي يستخدمه التطبيق
EXPOSE 22533

# تشغيل الخادم
CMD ["node", "index.js"]
