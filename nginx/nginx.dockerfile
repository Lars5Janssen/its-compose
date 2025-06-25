FROM nginx:latest

# BASIC
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y vim # FOR DEV


# 2.1 SSL
EXPOSE 443 80
COPY ./nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
COPY ./nginx-selfsigned.cert /etc/ssl/certs/nginx-selfsigned.cert
COPY ./dhparam.pem /etc/nginx/dhparam.pem
COPY ./self-signed.conf /etc/nginx/snippets/self-signed.conf
COPY ./ssl-params.conf /etc/nginx/snippets/ssl-params.conf

# 2.2 TCP DUMP
RUN apt-get install -y tcpdump

# 2.3 Basic Http auth
RUN apt-get install -y apache2
COPY ./htpasswd /etc/apache2/.htpasswd


COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./index.html /usr/share/nginx/html/index.html
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# ENTRYPOINT
ENTRYPOINT ["/entrypoint.sh"]
