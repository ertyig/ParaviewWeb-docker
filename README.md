# ParaviewWeb-docker
Running ParaviewWeb on a docker container


## Version
Paraview version: 5.10.0 \
Paraview Visualizer: 3.2.1

## How to build
`docker build -t paraviewweb .`

## How to start docker
`docker run -v /home/data/input:/input/ -v /home/data/output/:/output/ [Image ID or Image name]`

## How to run
You can see the ParaviewWeb on `http://localhost:8777` in your browser.
