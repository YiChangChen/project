# 使用合適的 Node.js 版本
FROM node:18 AS builder

# 設置工作目錄
WORKDIR /app

# 複製 package.json 和 package-lock.json
COPY package*.json ./

# 安裝依賴
RUN npm install

# 全局安裝 Angular CLI
RUN npm install -g @angular/cli

# 複製專案文件
COPY . .

# 建置 Angular 應用程式
RUN ng build --configuration production



FROM nginx:latest

# 從名為 "builder" 的 stage 複製建置好的 Angular 應用程式
COPY --from=builder /app/dist/project/browser /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

# 暴露端口
EXPOSE 80

# Nginx 預設會以前景模式運行
CMD ["nginx", "-g", "daemon off;"]
