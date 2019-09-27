#!/bin/bash

# stops the execution of a script if a command or pipeline has an error
set -e

# eliminate "Couldn't register with accessibility bus" errors
export NO_AT_BRIDGE=1

# pass your nvidia devzone username as the first argument to this script
USER_EMAIL=$1

# Run Nvidia SDK Manager command line
# and download the latest required SDK
sdkmanager --cli install \
	--user $USER_EMAIL \
	--logintype devzone \
	--product Jetson \
 	--version GA_4.2.2  \
	--targetos Linux \
	--host \
	--target P3448-0000 \
	--flash all \
	--license accept


  

