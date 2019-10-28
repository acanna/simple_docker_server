PORT = 4445

build: server.py
	docker build . --tag simple-docker-server

start: build
	docker run -it -d --rm -p ${PORT}:${PORT} simple-docker-server ${PORT}

stop:
	docker ps | grep simple-docker-server | cut -f 1 -d " " | xargs docker stop

clean:
	 docker images | grep simple-docker-server | sed -e "s/\(\S*\)\s*\(\S*\)\s*\(\S*\)\s.*/\3/" | xargs docker image rm
