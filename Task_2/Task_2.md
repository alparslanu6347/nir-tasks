# Task_2 : 

## Me and my team have to build a web application based on nginx in three supported versions:

- `mainline`, which uses nginx version `1.17.9-perl`,

- `stable`, which uses a DEFAULT_NGINX_VERSION variable defined in the `.env` file,

- `alpine`, which uses nginx version `1.17.9-alpine-perl`

## My role :

- To create a single `docker-compose.yaml` file with configuration for the three services, named exactly the same as the version listed above.
All of them should be built using nginx.Dockerfile with the following content, which is located in the same directory as the docker-compose.yaml file:
`ARG NGINX_VERSION`
`ARG BUILD_FILE`
`FROM nginx:${NGINX_VERSION}`
`COPY ${BUILD_FILE} /etc/nginx/conf.d`
All images should be built as an app with the supported version as a tag, with the exception of the stable service, which should use a version value tag from `DEFAULT_NGINX_VERSION`.
The mainline and `stable` services should use `debian.conf` as the `BUILD_FILE` argument, while the `alpine` file should be named `alpine.conf`. Both are located in the same directory as docker-compose.yaml.
the build process is executed in the app directory

/app
  ├── docker-compose.yaml
  ├── nginx.Dockerfile
  ├── alpine.conf
  ├── debian.conf
  ├── .env

