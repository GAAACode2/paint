FROM registry.access.redhat.com/ubi7/ubi:latest
RUN \
   yum update -y && \
   yum install httpd -y && \
   groupadd -g 1001 apache2 &&  \
   useradd -u 1001 -g apache2 apache2 && \
   sed -i '/^Listen 80/c\Listen 8080' /etc/httpd/conf/httpd.conf && \
   sed -i '/^User apache/c\User apache2' /etc/httpd/conf/httpd.conf && \
   sed -i '/^Group apache/c\Group apache2' /etc/httpd/conf/httpd.conf && \
   echo
COPY index.html *.js /var/www/html/
EXPOSE 8080
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
