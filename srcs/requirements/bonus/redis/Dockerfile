FROM debian:11

RUN apt update -y && apt upgrade -y && \
	apt install lsb-release curl gpg redis -y && \
	curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg && \
	echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/redis.list && \
	sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g"  /etc/redis/redis.conf && \
	sed -i "s|# maxmemory <bytes>|maxmemory 20mb|g"  /etc/redis/redis.conf && \
	echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf

CMD [ "redis-server", "--protected-mode", "no" ]