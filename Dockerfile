from python:3.9-slim-bullseye

RUN apt update && apt install -y --no-install-recommends \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /virtualhere
WORKDIR /virtualhere
RUN wget https://virtualhere.com/sites/default/files/usbserver/vhusbdarm
RUN echo $PWD

RUN chmod +x vhusbdarm

LABEL version="1.0.4"
LABEL permissions='\
{\
  "NetworkMode": "host",\
  "HostConfig": {\
    "Binds": [\
      "/usr/blueos/extensions/virtualhere:/virtualhere/config:rw"\
    ],\
    "Privileged": true,\
    "NetworkMode": "host"\
  }\
}'
LABEL authors='[\
    {\
        "name": "Willian Galvani",\
        "email": "willian@bluerobotics.com"\
    }\
]'
LABEL company='{\
        "about": "",\
        "name": "Blue Robotics",\
        "email": "support@bluerobotics.com"\
    }'
LABEL type="other"
LABEL tags='[\
        "communication"\
    ]'
LABEL readme='https://raw.githubusercontent.com/Williangalvani/BlueOS-VirtualHere/{tag}/Readme.md'
LABEL links='{\
        "website": "https://github.com/Williangalvani/BlueOS-VirtualHere",\
        "support": "https://github.com/Williangalvani/BlueOS-VirtualHere/issues"\
    }'
LABEL requirements="core >= 1.1"
ENTRYPOINT ["/virtualhere/vhusbdarm", "-c", "/virtualhere/config/config.ini" ]
