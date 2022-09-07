# BlueOS VirtualHere extension

This exposes usb devices via IP, which can be used in another client device

To use, first install it in BlueOS:


```
red-pill
sudo docker run -d --net=host --privileged --name=blueos-virtualhere --restart=unless-stopped williangalvani/blueos-extension-virtualhere:latest
```

# Client

Download a client from https://www.virtualhere.com/usb_client_software