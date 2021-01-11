# seeddms installation
# 
# VERSION 1.2
#

FROM adoptopenjdk:11-jre

MAINTAINER Patrick Weber


ENV APACHEDS_VERSION=2.0.0.AM26 \
    ADS_HOME=/usr/local/apacheds \
    ADS_INSTANCES=/var/apacheds \
    ADS_INSTANCE_NAME=default \
    APACHEDS_TLS_KS_PATH=/etc/apacheds/apacheds.jks

LABEL io.k8s.description="ApacheDS" \ 
      io.k8s.display-name="ApacheDS"

RUN apt-get update && \
    apt-get -y install \
      curl \
      gettext-base \
      apt-transport-https \
      gnupg \
      netcat \
      ldap-utils \
      base && \
    apt-get -y upgrade;apt-get clean;rm -rf /var/lib/apt/lists/* && \
    groupadd -r apacheds -g 433 && \
    mkdir /usr/local/apacheds && \
    useradd -u 431 -r -g apacheds -d /usr/local/apacheds -s /sbin/nologin -c "ApacheDS image user" apacheds && \
    curl https://downloads.apache.org/directory/apacheds/dist/$APACHEDS_VERSION/apacheds-$APACHEDS_VERSION.tar.gz -o /usr/local/apacheds/apacheds.tar.gz && \
    cd /usr/local/apacheds && \
    tar -xvzf apacheds.tar.gz --strip 1 && \
    rm apacheds.tar.gz && \
    mkdir -p /var/apacheds

ADD configs/ /var/templates/apacheds/configs
ADD entrypoint.sh /opt/entrypoint



RUN chown -R apacheds:apacheds /usr/local/apacheds /var/apacheds /var/templates/apacheds


USER 431

ENTRYPOINT ["/opt/entrypoint"]
