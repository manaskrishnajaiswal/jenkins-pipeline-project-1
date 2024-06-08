# Selection of base image acc to project req.
FROM nginx:latest

# Copy index.html file to our nginx hosting location -> /usr/share/nginx/html
COPY .//index.html /usr/share/nginx/html