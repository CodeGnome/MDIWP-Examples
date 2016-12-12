#!/usr/bin/env bash

# Provision an Ubuntu guest using VirtualBox.
vagrant up --provider virtualbox

# Install the officially-supported Docker module
# from the Puppet Forge as a non-root user.
vagrant ssh -c \
    'puppet module install \
     puppetlabs-docker_platform --version 2.1.0'

# Apply our local Docker manifest using the Puppet
# agent. No Puppet Master required!
#
# Note that the modulepath puppet installs to can
# vary on different Ubuntu releases, but this one is
# valid for the image defined in our Vagrantfile.
vagrant ssh -c \
    'sudo puppet apply \
     --modulepath ~/.puppet/modules \
     /vagrant/docker.pp'

# After adding the "ubuntu" user as a member of the
# "docker" group to enable non-root communications
# with the Docker daemon, we deliberately close the
# SSH control connection to avoid unhelpful Docker
# errors such as "Cannot connect to the Docker
# daemon. Is the docker daemon running on this
# host?" on subsequent connection attempts.
vagrant ssh -- -O exit
