# Most Vagrant boxes use 'vagrant' rather than
# 'ubuntu' as the default username, but the Xenial
# Xerus image uses the latter.
class { 'docker':
  package_name => 'docker.io',
  docker_users => ['ubuntu'],
}

# Install an Apache2 image based on Alpine Linux.
# Use port forwarding to map port 8080 on the
# Docker host to port 80 inside the container.
docker::run { 'apache2':
  image   => 'httpd:alpine',
  ports   => ['8080:80'],
  require => Class['docker'],
}
