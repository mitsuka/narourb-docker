FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y tzdata
ENV TZ Asia/Tokyo
RUN echo $TZ > /etc/timezone &&  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
RUN /usr/sbin/dpkg-reconfigure -f noninteractive tzdata
RUN apt-get update && apt-get install -y \
    wget \
    language-pack-ja \
    apt-file \
    software-properties-common \
    build-essential \
    openjdk-8-jre \
    unzip
ENV LANG=ja_JP.UTF-8
RUN mkdir -p /opt/aozora /opt/kindlegen /opt/mybooks
COPY binary/AozoraEpub3-1.1.0b46.zip /opt/
RUN cd /opt/aozora; unzip /opt/AozoraEpub3-1.1.0b46.zip 
RUN add-apt-repository -y ppa:brightbox/ruby-ng 
RUN apt-get update && apt-get install -y \
    ruby2.7 \
    ruby2.7-dev
RUN yes | gem install narou
WORKDIR /opt/mybooks/
RUN narou init -p /opt/aozora/ -l 1.6
RUN narou setting device=epub
VOLUME /opt/output
RUN narou setting convert.copy-to=/opt/output
RUN narou setting convert.no-open=true
