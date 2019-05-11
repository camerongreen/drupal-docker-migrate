#!/bin/bash

# To run this:
# docker-composer exec php bash -c 'bash .docker/init-drupal.sh'

chmod 755 web/sites/default/
if [[ ! $(grep -i 'E.A.R.T.H. installer' web/sites/default/settings.php) ]]
then
  cat .docker/build-assets/settings_update.txt >> web/sites/default/settings.php
fi
cp .docker/build-assets/settings.local.php web/sites/default

chmod 644 web/sites/default/*.php

drush upwd admin password

drush -y updatedb

composer require --dev \
  brainmaestro/composer-git-hooks \
  drupal/devel

composer require \
  drupal/admin_toolbar \
  drupal/coffee \
  drupal/migrate_tools \
  drupal/migrate_plus

drush pm:enable -y \
  admin_toolbar_tools \
  coffee \
  devel \
  migrate_tools \
  migrate_plus \
  migrate_drupal

