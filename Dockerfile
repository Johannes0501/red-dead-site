FROM node:20-alpine

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy source
COPY . .

# Build if needed
RUN npm run build --if-present

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:80/api/health || exit 1

EXPOSE 80
ENV PORT=80
ENV NODE_ENV=production

CMD ["npm", "start"]
