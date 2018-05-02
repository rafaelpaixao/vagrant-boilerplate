module VagrantConfig    
    SETTINGS = {
        "VM_NAME" => "VagrantVM",
        "BOX_NAME" => "ubuntu/xenial64",
        "BOX_VERSION" => ">= 0",
        "IP" => "192.168.33.10",
        "PUBLIC_NETWORK" => false, #Allow public network
        "MEMORY" => "2048",
        "CPUS" => "1",
        "CPU_EXECUTION_CAP" => "100"
    }
    PROJECTS = [
        {
            "FOLDER" => "../app",
            "SCRIPT" => "script/vagrant.sh",
            "ARGS" => [],
        }
    ]
end