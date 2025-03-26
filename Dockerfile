FROM python:3.9-alpine

RUN apk add --no-cache wget

RUN mkdir /virtualhere
WORKDIR /virtualhere

# Download the appropriate binary based on architecture
RUN case "$(uname -m)" in \
    aarch64) \
        wget -O vhusbd https://virtualhere.com/sites/default/files/usbserver/vhusbdarm64 ;; \
    armv7l|armhf) \
        wget -O vhusbd https://virtualhere.com/sites/default/files/usbserver/vhusbdarm ;; \
    x86_64) \
        wget -O vhusbd https://virtualhere.com/sites/default/files/usbserver/vhusbdx86_64 ;; \
    *) \
        echo "Unsupported architecture: $(uname -m)" && exit 1 ;; \
    esac && \
    chmod +x vhusbd

RUN echo $PWD

LABEL version="1.0.6"
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
ENTRYPOINT ["/virtualhere/vhusbd", "-c", "/virtualhere/config/config.ini" ]
