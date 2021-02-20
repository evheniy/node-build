# Debian 10 (Buster) + nodejs 14
FROM node:14-buster

# current version
RUN node -v
RUN npm -v
RUN yarn --version

RUN python --version

# python 3 + pip
RUN apt-get update
RUN apt-get install -yq python3 python3-pip python3-setuptools

RUN python3 --version
RUN pip3 --version

# aws
RUN pip3 install awscli

RUN aws --version

# puppeteer dependencies
RUN apt-get install -yq gconf-service curl libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget x11vnc x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic x11-apps xvfb

# aws-lambda-rie dependencies
RUN apt-get install -yq g++ make cmake unzip libcurl4-openssl-dev

# aws-lambda-rie
RUN curl -Lo /usr/local/bin/aws-lambda-rie https://github.com/aws/aws-lambda-runtime-interface-emulator/releases/latest/download/aws-lambda-rie && chmod +x /usr/local/bin/aws-lambda-rie

# google-chrome
RUN echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google.list
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN set -x && apt-get update && apt-get install -y google-chrome-stable
ENV CHROME_BIN /usr/bin/google-chrome

# Show installed versions
RUN set -x && google-chrome --version

# JAVA
RUN apt-get install -yq default-jre

RUN java -version

ENV JAVA_HOME $(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
RUN echo $JAVA_HOME

# updating npm
RUN npm i -g npm
RUN npm -v

# latest lerna + serverless
RUN npm i -g lerna serverless

RUN lerna --version
RUN sls --version
