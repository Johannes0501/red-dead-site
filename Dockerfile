FROM nginx:alpine

# Copy static files
COPY *.html /usr/share/nginx/html/
COPY *.css /usr/share/nginx/html/ 2>/dev/null || true
COPY *.js /usr/share/nginx/html/ 2>/dev/null || true
COPY *.jpg *.jpeg *.png *.gif *.svg /usr/share/nginx/html/ 2>/dev/null || true

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]