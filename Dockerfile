FROM node:16-slim

COPY . /app/
WORKDIR /app/

# Update apt packages
RUN runDeps="openssl ca-certificates patch gosu git tmux locales-all" \
 && apt-get update \
 && apt-get install -y --no-install-recommends $runDeps \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && npm install -g mrs-developer \
 && cp jsconfig.json.prod jsconfig.json \
 && mkdir -p /app/src/addons \
 && rm -rf /app/src/addons/* \
 && find /app/ -not -user node -exec chown node {} \+

USER node
RUN yarn \
 && yarn build \
 && rm -rf /home/node/.cache
USER root

EXPOSE 3000 3001 4000 4001

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["yarn", "start:prod"]
