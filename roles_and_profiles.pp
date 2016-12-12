####################################################
# Profiles
####################################################
# The "dockerd" profile uses a forge module to
# install and manage the Docker daemon. The only
# difference between this and the "docker" class
# from the earlier docker.pp example is that we're
# wrapping it inside a profile.
class profile::dockerd {
    class { 'docker':
      package_name => 'docker.io',
      docker_users => ['ubuntu'],
    }
}

# The "alpine33" profile manages the presence or
# absence of the Alpine 3.3 Docker image using a
# parameterized class. By default, it will remove
# the image.
class profile::alpine33 ($status = 'absent') {
    docker::image { 'alpine_33':
        image     => 'alpine',
        image_tag => '3.3',
        ensure    => $status,
    }
}

# The "alpine34" profile manages the presence or
# absence of the Alpine 3.4 Docker image. By
# default, it will remove the image.
class profile::alpine34 ($status = 'absent') {
    docker::image { 'alpine_34':
        image     => 'alpine',
        image_tag => '3.4',
        ensure    => $status,
    }
}

####################################################
# Roles
####################################################
# This role combines two profiles, passing
# parameters to add or remove the specified images.
# This particular profile ensures the Alpine 3.3
# image is installed, and removes Alpine 3.4 if
# present.
class role::alpine33 {
    class { 'profile::alpine33':
	status => 'present',
    }

    class { 'profile::alpine34':
	status => 'absent',
    }
}

# This role is the inverse of role::alpine33. It
# calls the same parameterized profiles, but
# installs Alpine 3.4 and removes Alpine 3.3.
class role::alpine34 {
    class { 'profile::alpine33':
	status => 'absent',
    }

    class { 'profile::alpine34':
	status => 'present',
    }
}

####################################################
# Nodes
####################################################
# Apply role::alpine33 to any host with "alpine33"
# in its hostname.
node /alpine33/ {
    include ::role::alpine33
}

# Apply role::alpine34 to any host with "alpine34"
# in its hostname.
node /alpine34/ {
    include ::role::alpine34
}
