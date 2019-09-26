# jetdev_container
nvidia jetson development environment container


# Notes

## Building container
`docker build --tag jetso .`

## Running container
`docker run -it --rm -e DISPLAY=10.0.1.2:0 -v /Users/todd/Documents/proj/store_jetso:/home/jetpack --shm-size=1gb jetso`

(Note that the display variable is specific to your localhost X11 setup.)

