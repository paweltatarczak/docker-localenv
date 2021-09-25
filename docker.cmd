@setlocal enableextensions
@cd /d "%~dp0"

@rem Download and install VirtualBox
curl -o ./VirtualBox.exe https://download.virtualbox.org/virtualbox/6.1.26/VirtualBox-6.1.26-145957-Win.exe --ssl-no-revoke
VirtualBox.exe --extract --path Vbox --silent
call msiexec /i Vbox\VirtualBox-6.1.26-r145957.msi /passive /norestart
del VirtualBox.exe
rmdir /S /Q Vbox

@rem Download and install Vagrant
curl -o ./vagrant.msi https://releases.hashicorp.com/vagrant/2.2.18/vagrant_2.2.18_x86_64.msi --ssl-no-revoke
call msiexec /i vagrant.msi /passive /norestart
del vagrant.msi

@rem Prepare sync folder
mkdir data

echo VirtualBox and Vagrant has been installed.
pause
