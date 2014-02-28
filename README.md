docstack
========

Docstack is an experiment in replacing the current [devstack](http://devstack.org/) project used in OpenStack. There are several issues in devstack that we are trying to address.

* Use of bash makes extending devstack hard
* Devstack has to know about the projects it is building
* Various projects have integrated into devstack in wildly different ways
* Each openstack project in devstack has to share the same packages and requirements
* Devstack needs to be run in a VM as it tends to copy lots of stuff into the host OS
* Devstack is slow to fire up

We plan to address these issues by building a sytem that allows each project in devstack to own the way in which it is deployed. Devstack then only needs to know where the project artifacts are to be able to add a project to a devstack cluster. 

This is achieved by placing a /docstack directory in each project wishing to be part of docstack. In that directory is a Dockerfile containing the instructions for building a Docker image for the project (and any sudry required files). 

Each of the repositories is then monitored by a Jenkins server. On every change, the Jenkins server will checkout the proejct, build a new Docker image and upload it to a repository. Over time, we plan to have Docker imags for latest as well as milestone and named OpenStack releases.

Finally, the user uses the [Fig](http://orchardup.github.io/fig/) project to orchestrate their specific docstack set up. Fig defines the various Docker images needed (both projects and infrastructure). After checking out the docstack directory, the user can spin up a docstack by typing 

```
  fig up
```

This will download the needed Docker images and fire them up on the user's machine.

Getting started on MacOS X
--------------------------

1. Get Docker installed

  http://docs.docker.io/en/latest/installation/mac/
  
2. Install Fig

  http://orchardup.github.io/fig/
  
3. Clone the docstack repo

  git clone git@github.com:docstack/docstack.git
