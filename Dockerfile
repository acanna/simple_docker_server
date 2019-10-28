FROM ubuntu:latest

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

COPY server.py /usr/bin/server.py

EXPOSE 65432

ENTRYPOINT ["python3", "/usr/bin/server.py"]