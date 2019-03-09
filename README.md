## Yii Docker Compose

This is based on the official [Yii 2.0 Framework](http://www.yiiframework.com/) image on [DockerHub](https://hub.docker.com/r/yiisoftware/yii2-php/) for PHP.

## Modifications

This is a mod by Xecta Solutions to manage Yii projects in a more easier way. The following enhancements are made to the official docker compose files.

- Installs the base framework by default using a composer container.
- MySQL (host name: mysql)
- PhpMyAdmin (available by default on port 8081)
- Configurable parameters in .env file (APP_PORT and PHP_MY_ADMIN port can be managed)
- Database is stored locally (_db-data_ folder) and can be versioned if required.

Original Repo: https://github.com/yiisoft/yii2-docker

## How to run

Install Docker or Docker Toolbox from http://www.docker.com

- Clone from Repository

- Change the working directory to the downloaded folder and call docker-compose up

```
docker-compose up
```

or run add the -d option to run it in background.

```
docker-compose up -d
```

This will start the containers and will start the installation of Yii framework and composer packages. Once the installation is complete you will see the Yii home page in localhost:8080 (or the port you specified in ENV).

Note: If you use docker toolbox, you might need to use the IP address of the docker machine rather than `localhost`

## App Folder

Yii framework will be installed in a subfolder `app`.

## Database

MySql stores data in local folder `.db_data`. If you delete the folder database contents will be lost. You may ignore the database contents from .gitignore by uncommenting the line in `.git-ignore` file.

```
#To ignore local db changes you may uncomment the following line
#.db_data
```

Default user name is `root` with password `secret`

PhpMyAdmin can be accessed on http://localhost:8081

## Configuration

Edit the .env file and modify as necessary

## How to run Yii commands?

You will need to use the `exec` command to access the shell of php container.

```
docker-compose exec php bash
```

Now you should be able to run composer commands or Yii commands

## Stopping containers

```
docker-compose down
```

## Official Yii Docker readme

## About

These Docker images are built on top of the official PHP Docker image, they contain additional PHP extensions required to run Yii 2.0 framework, but no code of the framework itself.
The `Dockerfile`(s) of this repository are designed to build from different PHP-versions by using _build arguments_.

### Available versions for `yiisoftware/yii2-php`

```
7.3-apache, 7.2-apache, 7.1-apache, 7.0-apache, 5.6-apache
7.3-fpm, 7.2-fpm, 7.1-fpm, 7.0-fpm, 5.6-fpm
```

## Setup

    cp .env-dist .env

Adjust the versions in `.env` if you want to build a specific version.

> **Note:** Please make sure to use a matching combination of `DOCKERFILE_FLAVOUR` and `PHP_BASE_IMAGE_VERSION`

## Configuration

- `PHP_ENABLE_XDEBUG` whether to load an enable Xdebug, defaults to `0` (false)
- `PHP_USER_ID` (Debian only) user ID, when running commands as webserver (`www-data`), see also [#15](https://github.com/yiisoft/yii2-docker/issues/15)

## Building

    docker-compose build

## Testing

    docker-compose run --rm php php /tests/requirements.php

### Xdebug

To enable Xdebug, set `PHP_ENABLE_XDEBUG=1` in .env file

Xdebug is configured to call ip `xdebug.remote_host` on `9005` port (not use standard port to avoid conflicts),
so you have to configure your IDE to receive connections from that ip.

If you are using macOS, you can fill `xdebug.remote_host` with `host.docker.internal`, due to a network limitation on mac (https://docs.docker.com/docker-for-mac/networking/#port-mapping)

    ### (macOS) configuration
    xdebug.remote_host=host.docker.internal

## Documentation

More information can be found in the [docs](/docs) folder.

## FAQ

- Error code `139` on Alpine for PHP `5.6-7.1` results from a broken ImageMagick installation
