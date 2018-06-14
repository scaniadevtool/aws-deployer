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
>docker pull scaniadevtools/aws-deployer:latest
>```
>
> or
> 
> ```sh
>docker pull scaniadevtools/aws-deployer
>```

### Semantic version number ``x.x.x``
This refers to the ``x.x.x`` version of the ``aws-deployer``image

> Usage example: ``1.0.0`` refers to the 1.0.0 version of the base image.
> 
> ```sh
>docker pull scaniadevtools/aws-deployer:1.0.0
>```

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

__Happy Hacking__

*Scania Devtools Team*

## Want to contribute?
Go to the [CONTRIBUTING]("CONTRIBUTING.md") page.
