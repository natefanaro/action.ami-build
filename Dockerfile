FROM hashicorp/packer:1.7.8

LABEL "com.github.actions.name"="ami-build"
LABEL "com.github.actions.description"="build and ami using packer"
LABEL "com.github.actions.icon"="check-square"
LABEL "com.github.actions.color"="blue"

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 jq && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools awscli boto3

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
