# ci-ansible-molecule-container  
Provides a Docker image that contains ansible and molecule and will be used to provision and run tests

## Prerequisites

The scripts have been developed and tested using:

- [Docker](https://www.docker.com/) (20.10.12)

## Software

The container has been built with the following versions installed on it:

Name                    | Version     
----------------------- | ------------
Ansible                 | 2.15.6      
Molecule                | 6.0.2       

## Versioning

The images are built and tagged with Concourse and have the following prefix:

```
ansible-2.15.6-molecule-6.0.2-<CONTAINER_VERSION>
```
The `CONTAINER_VERSION` follows the semantic versioning approach.
