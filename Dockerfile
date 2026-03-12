FROM ubuntu:22.04

WORKDIR /app

RUN apt-get update && \
    apt-get install -y cowsay fortune-mod netcat && \
    apt-get clean
# add cowsay & fortune path
ENV PATH="/usr/games:${PATH}"

COPY wisecow.sh .

RUN chmod +x wisecow.sh

EXPOSE 4499

CMD ["./wisecow.sh"]
