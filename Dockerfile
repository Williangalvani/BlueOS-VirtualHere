from python:3.9-slim-bullseye

RUN apt update && apt install -y wget

RUN wget https://virtualhere.com/sites/default/files/usbserver/vhusbdarm
RUN chmod +x vhusbdarm

LABEL version="1.0"
LABEL permissions '\
{\
    "NetworkMode": "host",\
    ,"HostConfig":{\
        "Privileged": true,\
    }\
}'
LABEL authors '[\
    {\
        "name": "Willian Galvani",\
        "email": "willian@bluerobotics.com"\
    }\
]'
LABEL docs ''
LABEL company '{\
        "about": "",\
        "name": "Blue Robotics",\
        "email": "support@bluerobotics.com"\
    }'
LABEL readme 'https://raw.githubusercontent.com/Williangalvani/BlueOS-VirtualHere/{tag}/Readme.md'
LABEL website 'https://github.com/Williangalvani/BlueOS-VirtualHere'
LABEL support 'https://github.com/Williangalvani/BlueOS-VirtualHere/issues'
LABEL requirements="core >= 1"
ENTRYPOINT ./vhusbdarm
