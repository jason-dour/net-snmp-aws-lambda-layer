# net-snmp-aws-lambda-layer

AWS Lambda Layer for Net SNMP Tools.

## Why SNMP?!

Because.

To be more clear: because I needed it as a cloud guy who works hard to integrate on-premises infrastructure with cloud.  And SNMP is a reasonable way for a Lambda to extract information from decades of existing on-premises infrastructure.

This is why SNMP.  :)

## Building the Layer

1. Make certain you have the `jasondour/amazonlinux-gcc-devel` Docker image needed to build the layer.

    ``` shell
    $ docker images
    REPOSITORY                                                    TAG                 IMAGE ID            CREATED             SIZE
    jasondour/amazonlinux-gcc-devel                               latest              64ff20963c0a        7 minutes ago       668MB
    ```

    1. If you do not have the images, just pull them with a `docker pull` command.

1. Confirm the build directory is clean.

    ``` shell
    $ ls -1
    Dockerfile
    LICENSE
    README.md
    build.sh
    ```

1. Then execute the docker `jasondour/amazonlinux-gcc-devel` image to run the build script.

    ``` shell
    docker run -it -v `pwd`:/tmp/repo jasondour/amazonlinux-gcc-devel /tmp/repo/build.sh
    ```

## Deploy the Layer

Once the layer zip file is created, you can deploy it to your AWS account with the following command:

``` shell
aws lambda publish-layer-version --layer-name "net-snmp-58" --description "Net-SNMP Utilities for All Runtimes" --license-info "BSD-2-Clause" --zip-file "fileb://net-snmp-5.8.zip"
```
