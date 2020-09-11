FROM centos:8
ENV container docker
ARG ANSIBLE_VERSION=2.9.10
ARG MOLECULE_VERSION=3.0.7

RUN yum install -y epel-release \
                openssh-clients \
                git \
                sudo \
                python3-pip && \
                alternatives --set python /usr/bin/python3

RUN pip3 install ansible==${ANSIBLE_VERSION} \
                 boto \
                 boto3 \
                 dnspython \
                 netaddr \
                 molecule[docker] \
                 molecule==${MOLECULE_VERSION}

RUN rpm --import http://yum-repository.platform.aws.chdev.org/RPM-GPG-KEY-platform-noarch && \
    yum install -y yum-utils && \
    yum-config-manager --add-repo http://yum-repository.platform.aws.chdev.org/platform-noarch.repo && \
    yum install -y platform-tools-common && \
    yum clean all

RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    yum install -y docker-ce --nobest

RUN dbus-uuidgen > /var/lib/dbus/machine-id && \
    mkdir -p /var/run/dbus

ENTRYPOINT ["/bin/bash"]
