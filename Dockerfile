FROM php:7.2-apache

COPY src/ /var/www/html

#Specify the user with UID
USER 1001
    
EXPOSE 8080
