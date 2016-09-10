# -*- mode: ruby -*-
# vi: set ft=ruby :

# Setup local jupyter/julia environment for the course
# https://courses.edx.org/courses/course-v1:CaltechDelftX+QuCryptox+3T2016

Vagrant.configure(2) do |config|
  config.vm.define "CaltechDelftX-QuCryptox" do |machine|
    machine.vm.box = "puppetlabs/centos-7.2-64-nocm"
    machine.vm.box_url = "puppetlabs/centos-7.2-64-nocm"
    machine.vm.network :forwarded_port, guest: 8888, host: 8890, id: "jupyter", auto_correct: true
    machine.vm.provider "virtualbox" do |provider|
      provider.memory = 512
      provider.cpus = 1
    end
  end
  # disable IPv6 on Linux
  $linux_disable_ipv6 = <<SCRIPT
sysctl -w net.ipv6.conf.default.disable_ipv6=1
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.lo.disable_ipv6=1
SCRIPT
  config.vm.define "CaltechDelftX-QuCryptox" do |machine|
    machine.vm.provision :shell, :inline => "hostname CaltechDelftX-QuCryptox", run: "always"
    # jupyter fails to start when IPv6 is present
    machine.vm.provision :shell, :inline => $linux_disable_ipv6, run: "always"
    machine.vm.provision :shell, :inline => "sed -i 's/^::1/#::1/' /etc/hosts", run: "always"
    # jupyter must start on 0.0.0.0
    machine.vm.provision :shell, :inline => "sed -i 's/^127/#127/' /etc/hosts", run: "always"
    machine.vm.provision :shell, :inline => "echo 0.0.0.0 localhost >> /etc/hosts", run: "always"
    machine.vm.provision :shell, path: "install.sh", run: "always"
    machine.vm.provision :shell, path: "service.sh", run: "always"
    machine.vm.provision :shell, :inline => "systemctl enable IJulia", run: "always"
    machine.vm.provision :shell, :inline => "systemctl start IJulia", run: "always"
    machine.vm.provision :shell, :inline => "iptables -I INPUT -m state --state NEW,ESTABLISHED -p tcp --dport 8888 -j ACCEPT", run: "always"
  end
end

