#!/bin/bash

# stops the execution of a script if a command or pipeline has an error
set -e

# eliminate "Couldn't register with accessibility bus" errors
export NO_AT_BRIDGE=1

bash

# run Nvidia SDK Manager
#sdkmanager

