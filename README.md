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


## To deploy on AbarCloud:

Follow the instructions [here](https://docs.abarcloud.com). Don't forget to set the GitHub branch to `advanced`, i.e.:
  `oc new-app --strategy=docker https://github.com/abarcloud/hello_world#advanced`

To deploy [Memcached](https://hub.docker.com/_/memcached) or [Redis](https://hub.docker.com/_/redis/) (without persistance storage) on AbarCloud:

1. Goto your desired project and click on "Add to project"

2. Click on the "Deploy Image" tab, select the "Image Name" radio button and type `memcached` or `redis` then click on the search icon.

3. Scroll down, ignore the warnings, and click on Create

4. Once the deployment is running, you can check the [memcached_test.rb](memcached_test.rb) and [redis_test.rb](redis_test.rb) files for examples of how to connect to these services by using deployment ENV variables to pass the memcached/redis host and port to your application.


## One repository, multiple starting commands

The Dockerfile in this repository has [`CMD sh commands.sh`](Dockerfile#L17). So the [commands.sh](commands.sh) file is run when the container is started, which uses the `ENTRYPOINT` ENV variable to decide how to start the application.

You can create a new application for each start command, so for the above web/workers/admin-ui example you'd run:

1. `oc new-app --strategy=docker --name=web --env='ENTRYPOINT=web' https://github.com/abarcloud/hello_world#advanced`

2. `oc new-app --strategy=docker --name=workers --env='ENTRYPOINT=workers' https://github.com/abarcloud/hello_world#advanced`

3. `oc new-app --strategy=docker --name=admin-ui --env='ENTRYPOINT=admin-ui' https://github.com/abarcloud/hello_world#advanced`

This creates 3 separate builds and deployments. You can setup web hooks from your GitHub/GitLab repo to trigger all 3 builds when new code is pushed or a new release tag is cut. You can find the AbarCloud build Generic Webhook URL in the Builds > Configuration tab.
