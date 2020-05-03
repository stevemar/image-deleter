FROM bash:4.4

COPY rm-images.sh /

CMD ["bash", "/rm-images.sh"]
