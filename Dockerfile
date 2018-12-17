FROM alpine:3.8

ENV HTTP_PORT=80

WORKDIR /root

# wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz \
# && tar xvfz dokuwiki-stable.tgz -C /opt/dokuwiki --strip-components 1 \
# && rm -f dokuwiki-stable.tgz \

RUN apk --update --no-cache add apache2 php7-apache2 php7-mbstring php7-session php7-json php7-xml openssl openrc tzdata \
 && mkdir -p /opt/dokuwiki /run/apache2 \
 && ln -s /opt/dokuwiki /var/www/localhost/htdocs \
 && : "Set Timezone" \
 && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
 && echo "Asia/Tokyo" > /etc/timezone \
 && apk del tzdata \
 && rm -rf /var/cache/apk/* 

EXPOSE $HTTP_PORT

VOLUME /var/log/apache2

CMD sed -i -e "s|#ServerName www.example.com:80|ServerName localhost:$HTTP_PORT|g" /etc/apache2/httpd.conf \
 && sed -i -e "s|Listen 80|Listen $HTTP_PORT|g" /etc/apache2/httpd.conf \
 && chown -R apache:apache /opt/dokuwiki \
 && /usr/sbin/httpd -f /etc/apache2/httpd.conf -D FOREGROUND

