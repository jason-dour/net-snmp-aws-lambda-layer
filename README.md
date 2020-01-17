# net-snmp-aws-lambda-layer

AWS Lambda Layer for Net SNMP Tools

## Notes

* Compiling net-snmp for static binaries:
  * [http://www.net-snmp.org/wiki/index.php/FAQ:Compiling_07](http://www.net-snmp.org/wiki/index.php/FAQ:Compiling_07)
* Try with Docker image `amazonlinux:latest`.
* Build Script
  * Install the compiler environment.
  * Download the source.
  * Unzip the source.
  * run `./configure` for the source.
  * Compile the source.
  * Packages the binaries into a zip file.
  * Deliver the zipfile through a mounted directory in the Docker image.
  * exit.
