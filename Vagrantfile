require './.vagrant/config'
include VagrantConfig

Vagrant.configure(2) do |config|
  config.vm.box = VAGRANTENV["VAGRANT_BOX"]
  config.vm.network "private_network", ip: VAGRANTENV["VAGRANT_IP"]
  config.vm.synced_folder ".", VAGRANTENV["VAGRANT_SHARED_FOLDER"], type: "nfs", :mount_options => ["dmode=777", "fmode=666"]

  config.vm.provider "virtualbox" do |vb|
    vb.name = VAGRANTENV["VAGRANT_NAME"]
    vb.memory = VAGRANTENV["VAGRANT_MEMORY"]
    vb.cpus = VAGRANTENV["VAGRANT_CPUS"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", VAGRANTENV["VAGRANT_CPU_EXECUTION_CAP"]]
  end

  first = <<SCRIPT
  sudo apt-get update
  sudo -u root DEBIAN_FRONTEND=noninteractive apt-get -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold"  install grub-pc
  sudo apt-get -y upgrade
SCRIPT

  last = <<SCRIPT
  sed -i -e '1iforce_color_prompt=yes\' /home/vagrant/.bashrc
  sudo service ssh restart
  echo -e "
    All done!
    Log in:
        $ vagrant ssh
    "
SCRIPT

  config.vm.provision "shell", inline: first
  config.vm.provision "shell", path: ".vagrant/root.sh", privileged: true, env: VAGRANTENV
  config.vm.provision "shell", path: ".vagrant/unprivileged.sh", privileged: false, env: VAGRANTENV
  config.vm.provision "shell", inline: last
  
end