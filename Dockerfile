FROM 416670754337.dkr.ecr.eu-west-2.amazonaws.com/ci-core-runtime:1.0.3

ARG ANSIBLE_VERSION=2.15.6
ARG MOLECULE_VERSION=6.0.2

RUN dnf install -y \
        dnf-utils-4.3.0 \
        docker-25.0.13 \
        findutils-4.8.0 \
        git-2.50.1 \
        openssh-clients-8.7p1 \
        python3.11-3.11.14 \
        python3.11-pip-22.3.1 \
        unzip-6.0 && \
    dnf clean all

RUN python3.11 -m pip install --no-cache-dir \
        ansible-core==${ANSIBLE_VERSION} \
        ansible==8.6.1 \
        ansible-lint==24.12.2 \
        boto3==1.42.32 \
        botocore==1.42.32 \
        dnspython==2.8.0 \
        lxml==5.3.0 \
        netaddr==1.3.0 \
        molecule[docker]==${MOLECULE_VERSION} \
        molecule==${MOLECULE_VERSION} \
        hvac==2.4.0 \
        passlib==1.7.4 \
        pywinrm==0.5.0

RUN rpm --import http://yum-repository.platform.aws.chdev.org/RPM-GPG-KEY-platform-noarch && \
    yum-config-manager --add-repo http://yum-repository.platform.aws.chdev.org/platform-noarch.repo && \
    dnf install -y \
        platform-tools-common-1.0.6 \
        platform-tools-docker-1.0.2 && \
    dnf clean all

ENTRYPOINT ["/bin/bash"]
