# Hello World


## To run locally:

```
bundle install
bundle exec rackup
```


## To run locally with Docker:

```
docker build .
docker run -p 8080:8080 MY_IMAGE_ID_FROM_ABOVE
```


## One repository, multiple starting commands

The Dockerfile in this repository has [`CMD sh commands.sh`](Dockerfile#L17). So the [commands.sh](commands.sh) file is run when the container is started, which uses the `ENTRYPOINT` ENV variable to decide how to start the application.


## To deploy on AbarCloud:

Follow the instructions [here](https://docs.abarcloud.com) to deploy the basic version of this application.

To deploy [Memcached](https://hub.docker.com/_/memcached) or [Redis](https://hub.docker.com/_/redis/) (without persistance storage) on AbarCloud:
1. Goto your desired project and click on "Add to project"
2. Click on the "Deploy Image" tab, select the "Image Name" radio button and type `memcached` or `redis` then click on the search icon.
3. Scroll down, ignore the warnings, and click on Create
4. Once the deployment is running, you can check the [memcached_test.rb](memcached_test.rb) and [redis_test.rb](redis_test.rb) files for examples of how to connect to these services.
