PORT = 65432

build:
	docker build . --tag simple-docker-server

start: build
	docker run -it -d --rm -p ${PORT}:${PORT} simple-docker-server

stop:
	docker ps | grep simple-docker-server | cut -f 1 -d " " | xargs docker stop

clean:
	 docker images | grep simple-docker-server | sed -e "s/\(\S*\)\s*\(\S*\)\s*\(\S*\)\s.*/\3/" | xargs docker image rm
