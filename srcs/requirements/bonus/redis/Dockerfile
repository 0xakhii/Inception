FROM debian:12

RUN apt update -y && apt upgrade -y

RUN apt install lsb-release curl gpg -y

RUN curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg && \
	echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/redis.list && \
	apt update -y && \
	apt install redis -y

RUN sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g"  /etc/redis/redis.conf && \
	sed -i "s|# maxmemory <bytes>|maxmemory 20mb|g"  /etc/redis/redis.conf && \
	echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf

CMD [ "redis-server", "--daemonize", "no" ]

