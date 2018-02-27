module VagrantConfig    
    VAGRANTENV = {
        "VAGRANT_NAME" => "VagrantVM",
        "VAGRANT_BOX" => "ubuntu/xenial64",
        "VAGRANT_IP" => "192.168.33.10",
        "VAGRANT_MEMORY" => "1024",
        "VAGRANT_CPUS" => "1",
        "VAGRANT_CPU_EXECUTION_CAP" => "100",
        "VAGRANT_SHARED_FOLDER" => "/home/vagrant/shared",
        
        # ADD MORE ENV VARIABLES HERE
    }
end