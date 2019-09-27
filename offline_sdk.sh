#!/bin/bash

# stops the execution of a script if a command or pipeline has an error
# set -e

# eliminate "Couldn't register with accessibility bus" errors
# export NO_AT_BRIDGE=1

# Run Nvidia SDK Manager command line
# and download the latest required SDK
sdkmanager --cli install \
	--product Jetson \
 	--version GA_4.2.2  \
	--targetos Linux \
	--host \
	--target P3448-0000 \
	--flash all \
	--license accept \
	--view log \
	--offline \
	--versionfile /home/jetpack/Downloads/nvidia/sdkm_downloads/sdkml3_jetpack_l4t_422_rev1.json

  

