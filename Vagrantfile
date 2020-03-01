Vagrant.configure("2") do |c|
  c.vm.box = "debian/stretch64"
  c.vm.box_check_update = false
  c.vm.hostname = "devopstask2"
  c.vm.network "forwarded_port", guest:8080, host: 8080, id:'spring-app'
  c.vm.network "forwarded_port", guest:8081, host: 8081, id:'node-app'

  c.vm.provider "virtualbox" do |v|
    v.name = "devopstask2"
    v.memory = 2048
    v.cpus = 2
  end

  c.vm.provision "file",
    source: "resources/devopstask2-springapp.yml",
    destination: "$HOME/resources/devopstask2-springapp.yml"

  c.vm.provision "shell",
    privileged: false,
    path: "scripts/autodeploy.sh"
end
