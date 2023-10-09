# deadline_client /  webservice
Please make sure you have the deadline installer tar file for linux in the root of the repo

## Building
```shell
docker build -t deadline_client:10.2.0.9 .
```

## Building docker volume for repository on network storage
```bash
docker volume create --driver local --opt type=nfs --opt o=addr=mull,rw --opt device=:/deadlineRepository10 deadline_volume
```

## Run container
To run container you need to mount your repository to the container, if the repository is local to the machines its easy you can run the below
```shell
docker container run -d -p 8082:8082 -v /opt/Thinkbox/deadlineRepository10:/opt/Thinkbox/deadlineRepository10 deadline_client:10.2.0.9
```
To mount to network storage, please refer to the above volume building and run using

```shell
docker container run -d -p 8082:8082 -v deadline_volume:/opt/Thinkbox/deadlineRepository10 deadline_client:10.2.0.9
```
