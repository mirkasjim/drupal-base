FROM uselagoon/python-3.9:latest
FROM uselagoon/php-8.3-cli-drupal:latest

RUN apk add --update  --no-cache curl wget python3 py3-pip 
RUN pip3 install --no-cache --upgrade pip setuptools



COPY composer.* /app/
COPY assets /app/assets
RUN composer install --no-dev
COPY . /app
RUN mkdir -p -v -m775 /app/web/sites/default/files

# Define where the Drupal Root is located
ENV WEBROOT=web
