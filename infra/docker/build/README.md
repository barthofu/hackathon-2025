# Build Seafile manually

You can build the Seafile community edition package on your own device.

## Usage

You can build in a Ubuntu virtual machine:

* Run `./seafile-build.sh 11.0.x`
* The stript will clone source codes to `./src`, and compile Seafile
* Finally, the `seafile-server-11.0.x` folder will be generated

Or build Seafile in a Ubuntu docker container:

* For Seafile 11.0, run `docker run --rm -it --volume=/$(pwd):/seafile ubuntu:22.04 /seafile/seafile-build.sh 11.0.x`

* For Seafile 12.0, run `docker run --rm -it --volume=/$(pwd):/seafile ubuntu:24.04 /seafile/seafile-build.sh 12.0.x`

Building in a docker container is the recommended one that will make sure the script always running in a clean environtment.

If you need to build for arm64 based architecture, simply run the script on an arm64 machine.
