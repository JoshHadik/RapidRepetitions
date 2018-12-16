# Thunder Wind Sprint

This is a sample application to showcase an optimized workflow for deploying a multi-container Docker application to Elastic Beanstalk with Travis CI.

The workflow utilizes two separate CD pipelines which assumes your Elastic Beanstalk has two separate environments, one for staging and one for production.

The Integration with Travis.yml looks roughly as follows:

### Pipeline 1 - Production

**Trigger** - Changes made on Master Branch (via push or pull request)

**Build Phase I** - Run tests on images

**Build Phase II** - Push images to Docker Hub with prod tags (since this is the production pipeline)

**Build Phase III** - Create a Dockerrun.aws.json in root directory that pulls images with prod tags.

**Deploy** - Deploy code to the production environment running on Elastic Beanstalk (which I named ThunderWindSprint-ProdEnv).

### Pipeline 2 - Development

**Trigger** - Changes made on Development Branch (via push or pull request)

**Build Phase I** - Run tests on images

**Build Phase II** - Push images to Docker Hub with dev tags (since this is the production pipeline)

**Build Phase III** - Create a Dockerrun.aws.json in root directory that pulls images with dev tags.

**Deploy** - Deploy code to the staging environment running on Elastic Beanstalk (which I named ThunderWindSprint-DevEnv)

### Get the code working

In order for this code to work, you must have done all of the expected setup on Github, Travis CI, and AWS, including:

1. Connect local repo with Github Repos
2. Connect Github Repo with Travis CI
3. Create an AWS Elastic Beanstalk App with a staging environment and a production environment.
4. Create IAM user with proper permissions for accessing EB app.
5. Setup Travis CI with the EB_ACCESS_KEY and EB_SECRET_KEY (based on IAM user), and DOCKER_ID and DOCKER_PASSWORD.

You must also replace .travis.yml with all of the information specific to your application, including:

1. env > global > APP_NAME
2. deployments > elastic_beanstalk > app
3. deployments > elastic_beanstalk > region
4. deployments > elastic_beanstalk > bucket_name
5. deployments > elastic_beanstalk > bucket_path
6. deploy > env (x2)
