# Alpha Thunder Nova

This is a sample application that showcases how to create a development environment with Docker that connects a Nuxt Frontend application with a Rails API backend application.

To get things up and running, simple clone this repository, enter into the alpha_thunder_nova folder, and run 'docker-compose up --build'


**NOTICE**

This application was setup when I was just learning Docker AND Vue, which means a lot of it is not optimized. I mainly just use this project to glance at if I forget any of the exact syntax while setting up a new Nuxt - Docker - Rails application (axios integration, dockerfiles, cors, etc.). However, certain things are very unattractive about this project, in particular the usage of non-alpine images and unneccessary code being copied into Dockerfiles.

Some day I hope to come back and create a full fledged example showcasing Docker best practices as well setting up CI/CD with a project like this, but for now, this is all I got.
