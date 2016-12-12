Vagrant.configure(2) do |config|
  # Install the official Ubuntu 16.04 Vagrant guest.
  config.vm.box = 'ubuntu/xenial64'

  # Forward port 8080 on the Ubuntu guest to port
  # 8080 on the VirtualBox host. Set the host value
  # to another unused port if 8080 is already in
  # use.
  config.vm.network 'forwarded_port',
		    guest: 8080,
		    host:  8080

  # Install the puppet agent whenever Vagrant
  # provisions the guest. Note that subsequent
  # releases have renamed the agent package from
  # "puppet" to "puppet-agent".
  config.vm.provision 'shell', inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive
    apt-get -y install puppet
  SHELL
end
