FROM bash:4.4

RUN apk add --no-cache git grep

COPY rm-images.sh .

CMD [ "bash", "/rm-images.sh", "/source" ]
