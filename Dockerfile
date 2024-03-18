FROM prestashop/base:8.1-apache
LABEL maintainer="PrestaShop Core Team <coreteam@prestashop.com>"
ENV PS_VERSION 8.1.4

ADD https://github.com/PrestaShop/PrestaShop/releases/download/8.1.4/prestashop_8.1.4.zip /tmp/prestashop.zip

RUN mkdir -p /tmp/data-ps \
   && unzip -q /tmp/prestashop.zip -d /tmp/data-ps/ \
   && bash /tmp/ps-extractor.sh /tmp/data-ps \
   && rm /tmp/prestashop.zip

RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN echo "good atm"
RUN service apache2 start