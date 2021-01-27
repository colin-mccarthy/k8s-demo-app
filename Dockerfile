FROM php:7.0-apache
COPY src/ /var/www/html

# In OpenShift, container will run as a random uid number and gid 0. Make sure things
# are writeable by the root group.
RUN mkdir -m 0775 -p /var/www/html ; chmod -R g+rwx /var/www/html  ; chgrp -R root /var/www/html 

# add capacity management library
RUN apk add --no-cache libcap=2.25-r1 && \
  # chown apache working directory
  chown -hR www-data:www-data /usr/local/apache2/ && \
  # Set capability to bind privileged ports as non-root user for httpd
  setcap 'cap_net_bind_service=+ep' /usr/local/apache2/bin/httpd

#Specify the user with UID
USER 1001
    

EXPOSE 8080
