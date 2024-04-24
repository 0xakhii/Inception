FROM debian:12

RUN apt update -y && apt upgrade -y

RUN apt install curl -y

RUN curl -LO https://github.com/google/cadvisor/releases/download/v0.41.0/cadvisor && \
	chmod +x cadvisor && mv cadvisor /bin/

CMD [ "cadvisor" , "-port=9090" ]