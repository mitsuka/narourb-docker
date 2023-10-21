FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
ENV AOZORA_VERSION=1.1.0b55Q
ENV AOZORA_FILENAME=AozoraEpub3-${AOZORA_VERSION}.zip
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
RUN mkdir -p /opt/aozora /opt/kindlegen /opt/mybooks /opt/output
RUN cd /opt; wget https://github.com/kyukyunyorituryo/AozoraEpub3/releases/download/${AOZORA_VERSION}/${AOZORA_FILENAME}
RUN cd /opt; unzip /opt/${AOZORA_FILENAME}
RUN add-apt-repository -y ppa:brightbox/ruby-ng 
RUN apt-get update && apt-get install -y \
    ruby2.7 \
    ruby2.7-dev
RUN yes | gem install narou
WORKDIR /opt/mybooks/
RUN narou init -p /opt/AozoraEpub3-${AOZORA_VERSION} -l 1.6
RUN narou setting device=epub
VOLUME /opt/output
RUN narou setting convert.copy-to=/opt/output
RUN narou setting convert.no-open=true
