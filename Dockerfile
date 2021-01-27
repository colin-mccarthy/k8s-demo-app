FROM php:7.2-apache

COPY src/ /var/www/html

#Add a user with userid 8877 and name nonroot
RUN useradd −u 8877 nonroot

#Run Container as nonroot
USER nonroot
    
EXPOSE 8080
