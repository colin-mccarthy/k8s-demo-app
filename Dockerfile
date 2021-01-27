FROM php:7.0-apache
COPY src/ /var/www/html

# In OpenShift, container will run as a random uid number and gid 0. Make sure things
# are writeable by the root group.
RUN mkdir -m 0775 -p /var/www/html ; chmod -R g+rwx /var/www/html  ; chgrp -R root /var/www/html 

RUN touch /var/www/html ; chmod g+rw /var/www/html ; chgrp root /var/www/html 

RUN touch /etc/passwd ; chmod g+rw /etc/passwd ; chgrp root /etc/passwd 

RUN touch  /etc/group ; chmod g+rw  /etc/group ; chgrp root  /etc/group 

#Specify the user with UID
USER 1001
    

EXPOSE 8080
