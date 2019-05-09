# Drupal migration docker stack

This is a docker setup to enable you to test out Drupal 7 to 8 migrations.

Do through these steps and you should have a Drupal site setup with all the migration modules enabled, and 
your migrations ready to run.

This is based on the wody/docker4drupal stack.

## Installation

### Add Drupal
If you do not already have a drupal installation, make one:

```bash
mkdir drupal-migrate
cd drupal-migrate
composer create-project drupal-composer/drupal-project:8.x-dev . --no-interaction
```

### Copy repo to .docker

Then copy this repository to a directory named _.docker_ in the base of your install, at the same level as the web
directory.

### Initialising databases

Put a copy of your Drupal 7 database sql into the _build-assets/db7_ directory.

If you have one put a copy of your Drupal 8 database sql into the _build-assets/db8_ directory.  Note even if you 
don't have one, once you get drupal running it can be a timesaver to _drush sql-dump > build-assets/db8_ for future
builds.

### Check your settings.

Have a look over the _.env_ file.   Make sure whatever host you have in the PROJECT_BASE_URL is also in your 
_/etc/hosts_ file.


### Go...

Run the containers.

```bash
docker-compose up -d --build
```

Run the initialisation script:
```bash
docker-composer exec php bash -c 'bash .docker/init-drupal.sh'
```

Get into the container and start running drush migrate:* commands.

```bash
docker-compose exec php bash
$ drush migrate:status
```
