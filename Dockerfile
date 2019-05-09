ARG PHP_TAG

FROM wodby/drupal-php:$PHP_TAG

# Add things I can't do without.
RUN sudo apk add --update \
  vim \
  iputils \
  net-tools

EXPOSE 80