# Web extraction with Scrapy and Scrapyd

## What is scrapy?

According to the maintainers at [Zyte](https://www.zyte.com/), Scrapy is

> An open source and collaborative framework for extracting the data you need from websites.
> In a fast, simple, yet extensible way.

## What is Scrapyd?

According to the [documentation](https://scrapyd.readthedocs.io/en/stable/index.html),

> Scrapyd is an application for deploying and running Scrapy spiders. It enables you to deploy (upload) your projects and control their spiders using a JSON API.

## What is this project about?

I was looking for a decent Docker image for Scrapy. I wanted something

+ with the most recent version of Python
+ easy to update and maintain
+ based on Debian

This is it.

## Build the Scrapy image

```bash
docker-compose -f crawling.yaml build scrapy
```

does the trick.

## Configuration

If you are using RabbitMQ together with Scrapy, you need to provide values for `RABBITMQ_DEFAULT_USER` and `RABBITMQ_DEFAULT_PASS`. I find that an environment file is quite convenient here.

## Spin the containers up

``docker-compose -f crawling.yaml up -d`` starts the containers for Scrapy and RabbitMQ in detached mode.

## Acknowledgements

I thank Itamar Turner-Trauring (@itamarst) for his articles at [https://pythonspeed.com](https://pythonspeed.com) and Maximilian Schwarzmüller at [ACADEMIND](https://academind.com/) for his excellent course on Docker and Kubernetes.
  