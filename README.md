-----------
Description
-----------

Setup local jupyter/julia environment for the course https://courses.edx.org/courses/course-v1:CaltechDelftX+QuCryptox+3T2016

Tested on:

- Ubuntu 16.04 x86_64, VirtualBox 5.0.24_Ubuntur108355, Vagrant 1.8.6
- Ubuntu 16.04 x86_64, VirtualBox 5.0.26r108824, Vagrant 1.8.4
- Ubuntu 14.04 x86_64, VirtualBox 4.3.40r110317, Vagrant 1.8.4


------------
Sample Usage
------------

Install VirtualBox https://www.virtualbox.org/ and Vagrant https://www.vagrantup.com/downloads.html

If you have *git* installed on your host machine (e.g. laptop) clone the repository:

        $ git clone https://github.com/marcindulak/vagrant-CaltechDelftX-QuCryptox.git

Otherwise create manually the folder called *vagrant-CaltechDelftX-QuCryptox* and save the
`https://raw.githubusercontent.com/marcindulak/vagrant-CaltechDelftX-QuCryptox/master/Vagrantfile` file under this folder.

Start the VM guest from the command prompt:

        $ cd vagrant-CaltechDelftX-QuCryptox
        $ vagrant up

Jypyter should be available from a web browser on your host under http://localhost:8890

If you have ssh access to the VM guest (by default on Linux and MAC) you can verify IJulia is running on the VM guest with:

        $ vagrant ssh -c "systemctl status IJulia"

Note that any files (e.g. downloaded course notebooks) available under the *vagrant-CaltechDelftX-QuCryptox* folder are
shared between the host and the VM guest. On the VM guest this folder is available as */vagrant*.

When not needed anymore, destroy the VM with::

        $ vagrant destroy -f


------------
Dependencies
------------


-------
License
-------

BSD 2-clause


--------
Problems
--------

