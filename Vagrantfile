require './.vagrant/config'
include VagrantConfig

Vagrant.configure(2) do |config|
  config.vm.box = SETTINGS["BOX_NAME"]
  config.vm.box_version = SETTINGS["BOX_VERSION"]
  config.vm.network "private_network", ip: SETTINGS["IP"]

  if SETTINGS["PUBLIC_NETWORK"]
    config.vm.network "public_network"
  end

  config.vm.provider "virtualbox" do |vb|
    vb.name = SETTINGS["VM_NAME"]
    vb.memory = SETTINGS["MEMORY"]
    vb.cpus = SETTINGS["CPUS"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", SETTINGS["CPU_EXECUTION_CAP"]]
  end

  config.vm.provider "vmware_fusion" do |v|
    v.vmx["memsize"] = SETTINGS["MEMORY"]
    v.vmx["numvcpus"] = SETTINGS["CPUS"]
  end

  first = <<SCRIPT
  sudo apt-get -qq update > /dev/null 2>&1
  sudo -u root apt-get -qq -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold"  install grub-pc > /dev/null 2>&1
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

  motd = <<SCRIPT
  sudo rm -rf /etc/update-motd.d/
  sudo rm /run/motd.dynamic
  if [ -f /etc/motd ] ; then
      rm /etc/motd
  fi
  sudo echo "Welcome!" > /etc/motd
SCRIPT

  config.vm.provision "first", type: "shell", inline: first, preserve_order: true

  for project in PROJECTS do
    guest = "/home/vagrant/" + project["FOLDER"].split('/')[-1]
    config.vm.synced_folder project["FOLDER"], guest, :mount_options => ["dmode=777", "fmode=666"]

    if project.key?("SCRIPT")
      script = project["FOLDER"] + "/" + project["SCRIPT"]
      config.vm.provision project["FOLDER"].split('/')[-1],
        type: "shell",
        preserve_order: true,
        privileged: false,
        path: script,
        args: script["ARGS"]
    end

  end

  config.vm.provision "motd", type: "shell", inline: motd, preserve_order: true
  config.vm.provision "last", type: "shell", inline: last, preserve_order: true
  
end