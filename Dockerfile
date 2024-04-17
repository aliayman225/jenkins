FROM nginx

COPY script.sh /script.sh

CMD ["echo", "Hello"]
