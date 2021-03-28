# A Dockerfile for Scrapy and Scrapyd

## What is scrapy?

According to the maintainers at [Zyte](https://www.zyte.com/), Scrapy is 

> An open source and collaborative framework for extracting the data you need from websites. 
> In a fast, simple, yet extensible way.

## What is Scrapyd?

According to the [documentation](https://scrapyd.readthedocs.io/en/stable/index.html), 

> Scrapyd is an application for deploying and running Scrapy spiders. It enables you to deploy (upload) your projects and control their spiders using a JSON API.

## Are there any other images and Dockerfiles?

Yes. An [image based on Debian Buster](https://hub.docker.com/r/vimagick/scrapyd) is actively maintained by @vimagick.

## Why did you write your own Dockerfile? 

I had the "pleasure" to inherit a Dockerfile for [Scrapy](https://scrapy.org/) that produces an image the size of the fungus in the [Malheur National Forest](https://www.fs.usda.gov/malheur/). At this point, I decided to roll my own.

## Concept

 + Scrapy is a Python-based framework. Consequently, I decided for `python:3.9.2-slim-buster` as the base image. It is compact and Debian-based. 
 + A Dockerfile should result in a reproducible image. Consequently, I decided for **strict version pinning** in the pip requirements file.
 + Scrapy is based on [Twisted](https://twistedmatrix.com/trac/). When installing via pip, gcc is required. However, there is no need to keep gcc in the final image. Consequently, I decided for a [multi-stage build](https://docs.docker.com/develop/develop-images/multistage-build/).
 
## Did you include any libraries to communicate with databases?

No! I am convinced that a scraper should be database-agnostic! All communication should be handled through queues! Consequently, only [pika](https://pika.readthedocs.io/en/stable/) is included. 

## Usage

Spin up your container via a [Docker Compose file](https://docs.docker.com/compose/). Don't forget to mount your scraper code into the container.

Enjoy!



## Acknowledgement

I thank Itamar Turner-Trauring (@itamarst) for his articles at https://pythonspeed.com.
