# github.com/tiredofit/docker-soulseek


[![GitHub release](https://img.shields.io/github/v/tag/tiredofit/docker-soulseek?style=flat-square)](https://github.com/tiredofit/docker-soulseek/releases/latest)
[![Build Status](https://img.shields.io/github/actions/workflow/status/tiredofit/docker-soulseek/main.yml?branch=main&style=flat-square)](https://github.com/tiredofit/docker-soulseek/actions)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/soulseek.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tiredofit/soulseek/)
[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/soulseek.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tiredofit/soulseek/)
[![Become a sponsor](https://img.shields.io/badge/sponsor-tiredofit-181717.svg?logo=github&style=flat-square)](https://github.com/sponsors/tiredofit)
[![Paypal Donate](https://img.shields.io/badge/donate-paypal-00457c.svg?logo=paypal&style=flat-square)](https://www.paypal.me/tiredofit)

* * *

## About

This will build a Docker image for [SoulSeek](https://slsknet.org, to allow it to be accessed via a web browser.

## Maintainer

- [Dave Conroy](https://github.com/tiredofit)

## Table of Contents

- [About](#about)
- [Maintainer](#maintainer)
- [Table of Contents](#table-of-contents)
- [Prerequisites and Assumptions](#prerequisites-and-assumptions)
- [Installation](#installation)
  - [Build from Source](#build-from-source)
  - [Prebuilt Images](#prebuilt-images)
    - [Multi Architecture](#multi-architecture)
- [Configuration](#configuration)
  - [Quick Start](#quick-start)
  - [Persistent Storage](#persistent-storage)
  - [Environment Variables](#environment-variables)
    - [Base Images used](#base-images-used)
- [Maintenance](#maintenance)
  - [Shell Access](#shell-access)
- [Support](#support)
  - [Usage](#usage)
  - [Bugfixes](#bugfixes)
  - [Feature Requests](#feature-requests)
  - [Updates](#updates)
- [License](#license)
- [References](#references)

## Prerequisites and Assumptions
*  Assumes you are using some sort of SSL terminating reverse proxy such as:
   *  [Traefik](https://github.com/tiredofit/docker-traefik)
   *  [Nginx](https://github.com/jc21/nginx-proxy-manager)
   *  [Caddy](https://github.com/caddyserver/caddy)

## Installation

### Build from Source
Clone this repository and build the image with `docker build <arguments> (imagename) .`

### Prebuilt Images
Builds of the image are available on [Docker Hub](https://hub.docker.com/r/tiredofit/soulseek)

Builds of the image are also available on the [Github Container Registry](https://github.com/tiredofit/docker-soulseek/pkgs/container/docker-soulseek) 
 
```
docker pull ghcr.io/tiredofit/docker-soulseek:(imagetag)
``` 

The following image tags are available along with their tagged release based on what's written in the [Changelog](CHANGELOG.md):

| Debian Base | Tag            |
| ----------- | -------------- |
| latest      | `:latest`      |


```bash
docker pull docker.io/tiredofit/soulseek:(imagetag)
```
#### Multi Architecture
Images are built primarily for `amd64` architecture, and may also include builds for `arm/v7`, `arm64` and others. These variants are all unsupported. Consider [sponsoring](https://github.com/sponsors/tiredofit) my work so that I can work with various hardware. To see if this image supports multiple architecures, type `docker manifest (image):(tag)`

## Configuration

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.
* Make [networking ports](#networking) available for public access if necessary
### Persistent Storage

The following directories are used for configuration and can be mapped for persistent storage.

| Directory   | Description                                                                         |
| ----------- | ----------------------------------------------------------------------------------- |
| `/data/ `   | Data files such as application data and logs                                        |
| `/www/logs` | Logfiles for Nginx error and Access                                                 |

### Environment Variables

#### Base Images used

This image relies on an [Alpine Linux](https://hub.docker.com/r/tiredofit/alpine) or [Debian Linux](https://hub.docker.com/r/tiredofit/debian) base image that relies on an [init system](https://github.com/just-containers/s6-overlay) for added capabilities. Outgoing SMTP capabilities are handlded via `msmtp`. Individual container performance monitoring is performed by [zabbix-agent](https://zabbix.org). Additional tools include: `bash`,`curl`,`less`,`logrotate`, `nano`.

Be sure to view the following repositories to understand all the customizable options:

| Image                                                  | Description                                           |
| ------------------------------------------------------ | ----------------------------------------------------- |
| [OS Base](https://github.com/tiredofit/docker-alpine/) | Customized Image based on Alpine Linux                |
| [OS Base](https://github.com/tiredofit/docker-debian/) | Customized Image based on Debian Linux                |
| [Nginx](https://github.com/tiredofit/docker-nginx/)    | Nginx webserver image based on either of the above OS |
| [NoVNC](https://github.com/tiredofit/docker-novnc/)    | NoVNC image which allows remote connectivity to GUI apps via a web browser |


* * *
## Maintenance

### Shell Access

For debugging and maintenance purposes you may want access the containers shell.

``bash
docker exec -it (whatever your container name is) bash
``
## Support

These images were built to serve a specific need in a production environment and gradually have had more functionality added based on requests from the community.
### Usage
- The [Discussions board](../../discussions) is a great place for working with the community on tips and tricks of using this image.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) for personalized support
### Bugfixes
- Please, submit a [Bug Report](issues/new) if something isn't working as expected. I'll do my best to issue a fix in short order.

### Feature Requests
- Feel free to submit a feature request, however there is no guarantee that it will be added, or at what timeline.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) regarding development of features.

### Updates
- Best effort to track upstream changes, More priority if I am actively using the image in a production environment.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) for up to date releases.

## License
MIT. See [LICENSE](LICENSE) for more details.
## References

* https://github.com/novnc/novnc/
