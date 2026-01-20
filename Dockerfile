FROM 416670754337.dkr.ecr.eu-west-2.amazonaws.com/ci-centos8-stream:1.0.0

ARG ANSIBLE_VERSION=2.9.10
ARG MOLECULE_VERSION=3.0.7
ARG YUM_REPOSITORY=yum-repository.platform.aws.chdev.org

RUN dnf install -y \
        epel-release-8 \
        git-2.43.0 \
        iptables-1.8.5 \
        openssh-clients-8.0p1 \
        python38-3.8.17 \
        python38-pip-19.3.1 \
        yum-utils-4.0.21 && \
    dnf clean all && \
    alternatives --set python /usr/bin/python3

RUN python -m pip install --no-cache-dir --upgrade \
        pip==25.0.1 && \
    pip3 install --no-cache-dir \
        ansible==${ANSIBLE_VERSION} \
        botocore==1.37.38 \
        boto3==1.37.38 \
        dnspython==2.6.1 \
        netaddr==1.3.0 \
        molecule[docker]==${MOLECULE_VERSION} \
        molecule==${MOLECULE_VERSION}

RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    dnf install -y --nobest \
        docker-ce-26.1.3 && \
    dnf clean all

RUN dbus-uuidgen > /var/lib/dbus/machine-id && \
    mkdir -p /var/run/dbus

ENTRYPOINT ["/bin/bash"]
