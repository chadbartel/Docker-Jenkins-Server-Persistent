#!/bin/bash
docker build -t my-jenkins-image:latest .
docker volume create my-jenkins-volume
docker container run \
    -d \
    -p 8082:8080 \
    -v my-jenkins-volume:/var/jenkins_home \
    --name jenkins-local \
    --restart always
    my-jenkins-image:latest
docker container exec \
    jenkins-local \
    sh -c "cat /var/jenkins_home/secrets/initialAdminPassword"