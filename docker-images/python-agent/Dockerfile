FROM    python:3.6-alpine
USER    root
RUN     apk add --no-cache --update \
            git \
        && mkdir -p /var/jenkins_home \
        && addgroup -S jenkins \
        && adduser -S jenkins -G jenkins \
        && chown -R jenkins:jenkins /var/jenkins_home
USER    jenkins
LABEL   project="CI Dev Workspace"
LABEL   description="Python agent for Jenkins"
LABEL   author="David J. Sanders"
LABEL   email="dsanderscanada@gmail.com"
LABEL   repository="https://github.com/dsandersAzure/cidevworkspace"
LABEL   base_version="3.6"
LABEL   base_image="python"
LABEL   base_os="alpine"
