#Simple installation VirtualBox and Vagrant on Windows system in order to play with Docker.

1. Create directory and clone this repository.
2. Run docker.cmd as Administrator.
3. In command line run vagrant 'vagrant up'
4. Connect to virtual machine 'vagrant ssh'
5. Run example container image e.g. 'docker run -d -p 8000:80 docker/getting-started'
6. Under your host web browser enter '192.168.11.11:8000'

'Data' directory in host system is used to sync data with ubuntu system under /vagrant directory.
