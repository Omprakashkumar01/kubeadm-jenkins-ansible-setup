FROM ubuntu:20.04

RUN apt update && \
    apt install -y openjdk-17-jdk wget git curl && \
    wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war -P /opt/ && \
    useradd -m -s /bin/bash jenkins

USER jenkins
WORKDIR /opt
CMD ["java", "-jar", "jenkins.war"]

