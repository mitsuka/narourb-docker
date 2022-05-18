FROM ubuntu:trusty
ENV DEBIAN_FRONTEND=noninteractive
ARG amazon_eula=no
RUN echo "Asia/Tokyo\n" > /etc/timezone
RUN /usr/sbin/dpkg-reconfigure -f noninteractive tzdata
RUN apt-get update && apt-get install -y \
    wget \
    language-pack-ja \
    apt-file \
    software-properties-common \
    build-essential \
    openjdk-7-jre \
    unzip
ENV LANG=ja_JP.UTF-8
RUN mkdir -p /opt/aozora /opt/kindlegen /opt/mybooks
COPY binary/AozoraEpub3-1.1.0b46.zip /opt/
RUN cd /opt/aozora; unzip /opt/AozoraEpub3-1.1.0b46.zip 
RUN add-apt-repository -y ppa:brightbox/ruby-ng 
RUN apt-get update && apt-get install -y \
    ruby2.4 \
    ruby2.4-dev
RUN yes | sudo gem install narou
WORKDIR /opt/mybooks/
RUN narou init -p /opt/aozora/ -l 1.6
RUN narou setting device=epub
VOLUME /opt/output
RUN narou setting convert.copy-to=/opt/output
RUN narou setting convert.no-open=true
