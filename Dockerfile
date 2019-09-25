FROM ubuntu:18.04 

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -yq install \
		sudo \
		dialog \
		less \
		x-window-system \
		mesa-utils \
		locales \ 
		libcanberra-gtk-module \
		libcanberra-gtk3-module \
		libgconf-2-4 \
    && rm -rf /var/lib/apt/lists/*

# add a jetpack user
RUN useradd -ms /bin/bash jetpack

# set the locale for the container
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8   

ENV HOME /home/jetpack

# install the Jetson SDK Manager
COPY sdkmanager_0.9.14-4961_amd64.deb /sdkmanager_0.9.14-4961_amd64.deb
RUN dpkg -i sdkmanager_0.9.14-4961_amd64.deb
RUN rm sdkmanager_0.9.14-4961_amd64.deb

WORKDIR $HOME

COPY entry.sh /entry.sh
ENTRYPOINT /entry.sh

