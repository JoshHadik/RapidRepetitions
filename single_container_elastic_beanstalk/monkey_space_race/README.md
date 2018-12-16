# Monkey Space Race

This is an example application showcasing an optimized workflow for deploying a single-container Docker application to Elastic Beanstalk with Travis CI.

The workflow utilizes two separate CD pipelines which assumes your Elastic Beanstalk has two separate environments, one for staging and one for production. Change to the development branch will deploy changes to the staging environment, and changes to the master branch will deploy to the production environment.
