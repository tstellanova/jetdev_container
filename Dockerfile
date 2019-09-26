FROM ubuntu:18.04 

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -yq install \
		sudo \
		dialog \
		less \
		vim \
		x-window-system \
		mesa-utils \
		locales \ 
		libcanberra-gtk-module \
		libcanberra-gtk3-module \
		libgconf-2-4 \
    && rm -rf /var/lib/apt/lists/*

# install the Jetson SDK Manager
# Note that this file is not included with the container github repo for licensing reasons
COPY sdkmanager_0.9.14-4961_amd64.deb /sdkmanager_0.9.14-4961_amd64.deb
RUN dpkg -i sdkmanager_0.9.14-4961_amd64.deb
RUN rm sdkmanager_0.9.14-4961_amd64.deb

# set the locale for the container
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# create a sudoer user who can install sdk components
ENV USER_NAME jetpack
ENV USER_PASS fartparty2019
RUN useradd  -p $(openssl passwd -1 $USER_PASS)  -ms /bin/bash -G sudo ${USER_NAME}

ENV HOME /home/jetpack
WORKDIR $HOME

COPY entry.sh /entry.sh
USER jetpack 
ENTRYPOINT /entry.sh

