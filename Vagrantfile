# -*- mode: ruby -*-
# vi: set ft=ruby :

# Discover VirtualBox version
#version = `#{ENV['VBOX_MSI_INSTALL_PATH']}\VBoxManage --version`
#version = /[0-9]+\.[0-9]+\.[0-9]+/.match(version)

Vagrant.configure("2") do |config|
  config.vm.define "docker-vm"
  config.vm.box = "generic/ubuntu1804"
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 3
  end
  
  config.vm.network "private_network", ip: "192.168.11.11"
  config.vm.synced_folder "data", "/vagrant", type: "virtualbox"

  config.vm.provision "shell", privileged: true, inline: <<-EOF
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	sudo apt-get install -y docker-ce docker-ce-cli containerd.io
	sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	sudo usermod -aG docker vagrant
  EOF

end
