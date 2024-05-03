FROM debian:11

RUN apt update -y && apt upgrade -y && \
	apt install curl -y && \
	curl -LO https://github.com/google/cadvisor/releases/download/v0.41.0/cadvisor && \
	chmod +x cadvisor && \
	mv cadvisor /bin/

CMD [ "cadvisor" , "-port=9090" ]