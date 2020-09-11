# ci-ansible-molecule-container
Provides a Docker image that contains ansible and molecule and will be used to provision and run tests

## Prerequisites

The scripts have been developed and tested using:

- [Docker](https://www.docker.com/) (2.3.0.3)

## Software

The container has been built with the following versions installed on it:

Name                    | Description                                                          | Example
----------------------- | -------------------------------------------------------------------- | ------------
ansible_version         | Ansible version installed on the container                           | 2.9.10
molecule_version          | Molecule version installed on the container                        | 3.0.7

## Versioning

The images are built and tagged with Concourse and have the following prefix:

```
ansible-2.9.10-molecule-3.0.7-<CONTAINER_VERSION>
```
The `CONTAINER_VERSION` follows the semantic versioning approach.
