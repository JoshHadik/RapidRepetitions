FROM node:9

ARG UID
RUN adduser nuxt --uid=$UID --disabled-password --gecos ""

ENV APP /usr/src/alpha_thunder_nova
RUN mkdir $APP
WORKDIR $APP

COPY package.json yarn.lock $APP/
RUN yarn

COPY * $APP/

CMD ["yarn", "run", "dev"]
