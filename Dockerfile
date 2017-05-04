FROM cloudron/base:0.10.0
MAINTAINER Miles Hingston <mhingston@users.noreply.github.com>

ENV PATH="${PATH}:/usr/local/node-6.9.5/bin"

RUN apt-get update && \
apt-get install -y nginx-extras apache2-utils

RUN mkdir -p /app/code && \
mkdir -p /tmp/dav

RUN chown -R www-data:www-data /app /tmp/dav

RUN wget https://github.com/keeweb/keeweb/archive/$(curl -s https://api.github.com/repos/keeweb/keeweb/releases | grep tag_name | head -n 1 | cut -d '"' -f 4).tar.gz && \
tar zxf *.tar.gz && \
mv keeweb-* /app/code/keeweb && \
rm *.tar.gz

WORKDIR /app/code/keeweb

ADD vault.kdbx /app/code/keeweb

RUN npm install && \
npm start

ADD nginx.conf /etc/nginx
ADD keeweb.conf /etc/nginx/sites-enabled
RUN unlink /etc/nginx/sites-enabled/default

EXPOSE 8000

ADD start.sh /app/code/keeweb

CMD ["/app/code/keeweb/start.sh"]