FROM node:lts-buster

RUN apt-get update
RUN apt-get -y install python3 python3-pip python3-setuptools libgtk2.0-0 libgtk-3-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb
RUN pip3 install awscli
RUN yarn global add lerna serverless cypress

RUN yarn --version
RUN lerna --version
RUN sls --version
RUN cypress --version
