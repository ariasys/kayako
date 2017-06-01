#!/bin/bash

if [ -z "$(ls -A /usr/share/nginx/html)" ]; then
  # Enter database details here
  db_host="kayako.db"
  db_user="kayako"
  db_pass="K@y@k0!"
  db_name="kayako"

  # Extracting product files to document root
  tar -xzf /opt/kayako.tar.gz -C /usr/share/nginx/html/
  chown -R www-data:www-data /usr/share/nginx/html/
  chmod -R 777 /usr/share/nginx/html/{__apps,__swift/files,__swift/cache,__swift/logs,__swift/geoip}
  cp /usr/share/nginx/html/__swift/config/config.php.new /usr/share/nginx/html/__swift/config/config.php

  # Preparing config file
  sed -i "s/'DB_HOSTNAME', '127.0.0.1'/'DB_HOSTNAME', '$db_host'/" /usr/share/nginx/html/__swift/config/config.php
  sed -i "s/'DB_USERNAME', 'root'/'DB_USERNAME', '$db_user'/" /usr/share/nginx/html/__swift/config/config.php
  sed -i "s/'DB_PASSWORD', ''/'DB_PASSWORD', '$db_pass'/" /usr/share/nginx/html/__swift/config/config.php
  sed -i "s/'DB_NAME', 'swift'/'DB_NAME', '$db_name'/" /usr/share/nginx/html/__swift/config/config.php
  sed -i "s/APP_ONSITE/\/\/ APP_ONSITE/" /usr/share/nginx/html/__swift/library/class.SWIFT.php
  sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 20M/" /etc/php5/fpm/php.ini
  sed -i "s/max_execution_time = 30/max_execution_time = 300/" /etc/php5/fpm/php.ini

  # Start mysql and nginx
  service php5-fpm reload
  service nginx reload
fi
