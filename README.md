# Open Lighting Architecture Container

This Dockerfile builds [Open Lighting Architecture](https://github.com/OpenLightingProject/ola) from scratch on top of Alpine Linux 3.5.

The following plugins are available:

* Dummy
* ArtNet
* ShowNet
* ESP Net
* Serial USB
* Enttec Open DMX
* SandNet
* StageProfi
* Pathport
* E1.31 (sACN)
* USB
* __FTDI USB DMX__
* __OSC__
* SPI
* KiNET
* KarateLight
* Milford Instruments
* Renard
* UART native DMX
* Open Pixel Control
* GPIO

## Usage

The easiest way to provide proper connectivity is to use the `host` network.

```
docker run -it --net host jankoppe/openlightingarchitecture
```

Otherwise you will probably want to expose Port `9090` and `9010`, whereas the webinterface is available via HTTP on Port `9090`.

### FTDI USB DMX

To use the dumb FTDI USB DMX adapters (which are extremely cheap) the container needs more privileges to directly communicate with the ftdi chip using libftdi.

```
docker run -it --net host --privileged --device /dev/ttyUSB0 jankoppe/openlightingarchitecture
```