# Kayako Help Desk - Nginx SSL PHP Container (based on marvambass/nginx-ssl-php)
_maintained by AriaSys_

[FAQ - All you need to know about the marvambass Containers](https://marvin.im/docker-faq-all-you-need-to-know-about-the-marvambass-containers/)

## What is it

This Dockerfile (available as ___aryasys/kayako___) gives you Kayako Help Desk installed in a completly secure running Nginx Container with php5-fpm.

It's based on the [marvambass/nginx-ssl-php](https://registry.hub.docker.com/u/marvambass/nginx-ssl-php/) Image

View in GitHub [ariasys/kayako](https://github.com/ariasys/kayako.git)

## Using the ariasys/kayako Container

# Start Container
```
docker-compose up -d
* All necessary images are automatically pull on first run if they do not exist;
Thus, a first run may take a while to start.
** Remember of renamed the folder "setup" to "_setup" on "public_html after running de setup of system from browser.
```

# Stop Container
```
docker-compose down
```

