# deadline_client /  webservice
Please make sure you have the deadline installer tar file for linux in the root of the repo

## Building
```shell
docker build -t deadline_client:10.2.0.9 .
```

## Run container
To run container you need to mount your repository to the container, if the repository is local to the machines its easy you can run the below
```shell
docker container run -d -p 8082:8082 deadline_client:10.2.0.9
