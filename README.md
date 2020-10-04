
# ft_server

This project is an introduction to Docker and web servers.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

```
docker build ft_server_image:latest .
```

```
docker run -p 80:80 -p 443:443 --name ft_server_image:latest ft_server_container
```

### Prerequisites

`Docker` and `Docker-machine` are needed to install the software. This is how to install them

```
Brew install docker
```

```
Brew install docker-machine
```

### Installing

To access the server on HTTP, simply type the ip address in a browser. The ip address is obtained as such

```
docker-machine ip
```

To access it on HTTPS, type the ip address preceded by ´https´. It will look as such

```
[eventual https:// prefix][ip address]
```


## Running the tests

There are currently no tests for it.


## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Versioning

<!-- We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).  -->

## Authors

* **Lacollar** 

## License

This project is not licensed for the moment.

## Acknowledgments

* Everyone at 19 who helped me