FROM node:dubnium

RUN apt-get update
RUN apt-get -y install python3 python3-pip python3-setuptools
RUN pip3 install awscli
RUN yarn global add lerna serverless

ENV NODE_ENV production
