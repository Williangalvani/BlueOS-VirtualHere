from python:3.9-slim-bullseye

RUN apt update && apt install -y wget

RUN wget https://virtualhere.com/sites/default/files/usbserver/vhusbdarm
RUN chmod +x vhusbdarm

LABEL version="1.0"
LABEL permissions="--net=host --privileged"
LABEL requirements="core > 1"

ENTRYPOINT ./vhusbdarm
