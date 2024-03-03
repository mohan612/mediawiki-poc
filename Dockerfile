FROM ubuntu:20.04

WORKDIR /app

# Set the timezone to Asia/Kolkata
RUN ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

# Copy necessary files
COPY ./LocalSettings.php /app

# Update packages and install dependencies
RUN apt-get update && apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 php7.4 php7.4-mysql libapache2-mod-php7.4 php7.4-xml php7.4-mbstring php7.4-apcu php7.4-intl imagemagick inkscape php7.4-gd php7.4-cli php7.4-curl php7.4-bcmath git- wget tar \
    && service apache2 start \
    && service apache2 reload

WORKDIR /tmp
# Download and install MediaWiki
RUN wget https://releases.wikimedia.org/mediawiki/1.41/mediawiki-1.41.0.tar.gz \
    && tar -xvzf /tmp/mediawiki-*.tar.gz \
    && mkdir /var/lib/mediawiki \
    && mv mediawiki-*/* /var/lib/mediawiki 

# Create symbolic link for MediaWiki
RUN ln -s /var/lib/mediawiki /var/www/html/mediawiki \
    && phpenmod mbstring \
    && phpenmod xml \
    && service apache2 restart \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80

# Command to start Apache and keep it running in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]


