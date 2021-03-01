ARG WORKSPACE_DIR="/workspace/invocables-typescript"

FROM node:12-buster as build-image
ARG WORKSPACE_DIR
RUN mkdir -p ${WORKSPACE_DIR}
RUN apt-get update && \
    apt-get install -y \
    g++ \
    make \
    cmake \
    unzip \
    libcurl4-openssl-dev
WORKDIR ${WORKSPACE_DIR}
COPY . .
RUN npm install aws-lambda-ric
RUN npm install
RUN ls

FROM node:12-buster-slim
RUN npm i -g typescript ts-node
ARG WORKSPACE_DIR
WORKDIR ${WORKSPACE_DIR}
COPY --from=ashwanth1109/prodserver server.ts .
COPY --from=build-image ${WORKSPACE_DIR} ${WORKSPACE_DIR}
RUN npm i -D express @types/node @types/express
RUN chmod 755 ./entry.sh
EXPOSE 8000
ENTRYPOINT ["./entry.sh"]
CMD ["echo.handler"]
