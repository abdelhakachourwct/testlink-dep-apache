FROM ubuntu:24.04

RUN apt update && apt install -y libpng16-16t64

WORKDIR /root/dotdebs

COPY . .

RUN apt install -y ./libldap-2.4-2_2.4.47+dfsg-3+deb10u7_amd64.deb \
    ./libssl1.1_1.1.1n-0+deb10u6_amd64.deb \
    ./apache2-bin_2.4.59-1~deb10u1_amd64.deb \
    ./apache2-data_2.4.59-1~deb10u1_all.deb \
    ./apache2-utils_2.4.59-1~deb10u1_amd64.deb \
    ./mime-support_3.62_all.deb \
    ./apache2_2.4.59-1~deb10u1_amd64.deb \
    ./libwebp6_0.6.1-2+deb10u3_amd64.deb \
    ./libpng16-16_1.6.36-6_amd64.deb \
    ./libjpeg62-turbo_1.5.2-2+deb10u1_amd64.deb \
    ./php-common_69_all.deb \
    ./php7.3-common_7.3.31-1~deb10u7_amd64.deb \
    ./php7.3-json_7.3.31-1~deb10u7_amd64.deb \
    ./php7.3-opcache_7.3.31-1~deb10u7_amd64.deb \
    ./php7.3-readline_7.3.31-1~deb10u7_amd64.deb \
    ./php7.3-curl_7.3.31-1~deb10u7_amd64.deb \
    ./php7.3-gd_7.3.31-1~deb10u7_amd64.deb \
    ./php7.3-mbstring_7.3.31-1~deb10u7_amd64.deb \
    ./php7.3-mysql_7.3.31-1~deb10u7_amd64.deb \
    ./php7.3-xml_7.3.31-1~deb10u7_amd64.deb \
    ./php7.3-zip_7.3.31-1~deb10u7_amd64.deb \
    ./php7.3-ldap_7.3.31-1~deb10u7_amd64.deb \
    ./php7.3-cli_7.3.31-1~deb10u7_amd64.deb \
    ./libapache2-mod-php7.3_7.3.31-1~deb10u7_amd64.deb

RUN rm -r /var/www/html && mv ./testlink /var/www && mv /var/www/testlink /var/www/html

RUN chgrp www-data /var/www/html/gui/templates_c && chmod g+w /var/www/html/gui/templates_c

RUN mkdir -p /var/testlink/logs && chgrp www-data /var/testlink/logs && chmod g+w /var/testlink/logs

RUN mkdir -p /var/testlink/upload_area && chgrp www-data /var/testlink/upload_area && chmod g+w /var/testlink/upload_area

EXPOSE 80

CMD [ "apachectl", "-D", "FOREGROUND" ]