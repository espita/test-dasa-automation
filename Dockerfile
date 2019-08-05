FROM ubuntu:18.04

ENV BROWSER=firefox_headless

RUN apt update && \
    apt install -y curl \
    ruby-full \
    build-essential \
    patch \
    wget \
    ruby-dev \
    zlib1g-dev \
    liblzma-dev \
    firefox

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb
RUN rm google-chrome-stable_current_amd64.deb

# INSTALL FIREFOX
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz
RUN tar -x geckodriver -zf geckodriver-v0.24.0-linux64.tar.gz -O > /usr/bin/geckodriver
RUN chmod +x /usr/bin/geckodriver
RUN rm geckodriver-v0.24.0-linux64.tar.gz

## Chromedriver
RUN wget https://chromedriver.storage.googleapis.com/2.29/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/bin/
RUN chmod +x /usr/bin/chromedriver
RUN rm chromedriver_linux64.zip

RUN gem install bundler

COPY . /automation

WORKDIR /automation

RUN bundler install 

RUN ls -laGh /usr/bin| grep google

CMD bundle exec cucumber -p ${BROWSER}