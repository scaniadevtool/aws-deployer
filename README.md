[![Docker status](https://dockerbuildbadges.quelltext.eu/status.svg?organization=scaniadevtools&repository=aws-deployer)](https://hub.docker.com/r/scaniadevtools/aws-deployer/builds/)

AWS Deployer Docker Image
=================================
This repository contains Docker image for running AWS cli commands that assumes a IAM role baked into one cli command. They can be useful for deploying AWS CloudFormation templates in e.g. a build server where the build server need to assume some other role to deploy.

For usage details go (here)[aws-deployer]

Extensions
=========
There are extensions avaliable for the base image that extends the functionality 

Versions
========
We are using [semantic versioning](https://semver.org/) together with Docker versioning (e.g.  ``latest``).

Version numbers are updated for any change in this repo. This means that the version number of the base image is changed even if the source code has not changed. This is since we use Dockerhub's build engine for building the Docker images and it is based on tags. (If you have suggestions on how this can be fixed please tell us by creating an Issue or a Pull request.)

The versions avaliable are:

###  latest  or [empty] 
The latest version of the base ``aws-deployer``image. If you don't know which version you should choose, you probably want this one.

> Usage example:
> 
> ```sh
docker pull scaniadevtools/aws-deployer:latest
```
> or
> 
> ```sh
docker pull scaniadevtools/aws-deployer
```

### Semantic version number ``x.x.x``
This refers to the ``x.x.x`` version of the ``aws-deployer``image

> Usage example: ``1.0.0`` refers to the 1.0.0 version of the base image.
> 
> ```sh
docker pull scaniadevtools/aws-deployer:1.0.0
```

### [extension-name]
This refers to the latest version of the extension image with the name ``[extension-name]``.  

> Usage example: The extension name ``docker`` refers to the **latest** version of the [image with docker support](aws-deployer-docker).
>
>```sh
>docker pull scaniadevtools/aws-deployer:docker
>```

### x.x.x-[extension-name]
This refers to the ``x.x.x`` version of the extension image with the name ``[extension-name]``. 

> Usage example: Version ``1.0.0-docker`` refers to the 1.0.0 version of the [image with docker support](aws-deployer-docker).
>
> ```sh
> docker pull scaniadevtools/aws-deployer:1.0.0-docker
> ```


#### Displaying help.
```sh
> docker run -it scaniadevtools/aws-deployer --help
  assume [-h|--help] [-v|--version] -a|--account <aws account number> [-r|--role <IAM role>] [-p|--profile <aws cli profile name>] []

  Assumes a role in the specified AWS account and creates temporary credentials in the named profile.
    -h|--help      prints this help
    -v|--version   prints the current version of this script
    -a|--account   the AWS account number to deploy to. (mandatory)
    -r|--role      the IAM role to assume
    -p|--profile   the name of the resulting aws cli profile to use
```

#### Displaying script version.

```sh
> docker run -it scaniadevtools/aws-deployer --version
  assume version 1.0.0
```

#### Assuming an AWS role. (Main use case)


In this example the command:

``assume --account 123456789012 --profile assumed-profile``

is used in a Gitlab ``.gitlab-ci.yml`` file for CI/CD. The Gitlab project contains an AWS CloudFormation template named ``cloudformation-template.yml`` that is validated in the AWS account *123456789012* by assuming the ``arn:aws:iam::123456789012:role/DeployRole`` role that exist in the specified AWS account and have ``cloudformation:ValidateTemplate`` permissions. The temporary credentials resulting from the assume command are stored in an AWS profile named ``assumed-profile``.

**.gitlab-ci.yml:**
```yml
image: scaniadevtools/docker-aws-deployer

stages:
  - validate-template 

validate-template-in-account-123456789012: 
  stage: validate-template

  before_script:
    - assume --account 123456789012 --profile assumed-profile
  script:
    - aws cloudformation validate-template --template-body file://cloudformation-template.yml --region eu-west-1 --profile assumed-profile
```
The account number (*123456789012* in this example) can be located in the AWS console when logged into the account by selecting   *"Support"->"Support Center"* in the menu.  


### Start a bash session inside the container.
Starting a bash session in the container can be useful for debugging purposes.

```sh
   > docker run -it scaniadevtools/aws-deployer bash
   bash-4.3#
```
## Links
[Docker image on Dockerhub](https://hub.docker.com/r/scaniadevtools/aws-deployer/)

__Happy Hacking__

*Scania Devtools Team*

## Want to contribute?
Go to the [CONTRIBUTING]("CONTRIBUTING.md") page.
