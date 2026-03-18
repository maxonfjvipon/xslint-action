FROM node:22

LABEL "repository"="https://github.com/maxonfjvipon/xslint-action"
LABEL "maintainer"="Max Trunnikov"

RUN npm install -g @maxonfjvipon/xslint@0.0.4

WORKDIR /w
COPY entry.sh ./

ENTRYPOINT ["/w/entry.sh"]
