#FROM 416670754337.dkr.ecr.eu-west-2.amazonaws.com/ci-core-runtime:latest

FROM amazonlinux:2023

ARG ANSIBLE_VERSION=2.15.6
ARG MOLECULE_VERSION=6.0.2
ARG YUM_REPOSITORY=yum-repository.platform.aws.chdev.org

RUN dnf install -y openssh-clients \
                python3-pip \
                git \
                docker

RUN pip3 install ansible\
                 boto \
                 boto3 \
                 dnspython \
                 netaddr \
                 molecule[docker] \
                 molecule\
                 pywinrm

RUN rpm --import http://yum-repository.platform.aws.chdev.org/RPM-GPG-KEY-platform-noarch && \
    yum install -y yum-utils && \
    yum-config-manager --add-repo http://yum-repository.platform.aws.chdev.org/platform-noarch.repo && \
    yum install -y platform-tools-common && \
    yum install -y platform-tools-docker && \
    yum clean all

ENTRYPOINT ["/bin/bash"]
