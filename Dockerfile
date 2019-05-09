ARG PHP_TAG

FROM wodby/drupal-php:$PHP_TAG

RUN sudo apk add --update \
  vim \
  iputils \
  net-tools

EXPOSE 80