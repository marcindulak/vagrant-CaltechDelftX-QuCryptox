# skip if already installed
if test -d /home/vagrant/.julia; then exit 0; fi
sudo su - -c "yum clean all"
if `cat /etc/redhat-release | grep -qi 'release 7'` && ! rpm -q epel-release; then sudo su - -c "yum -y install https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-10.noarch.rpm"; fi
sudo su - -c "wget -q https://copr.fedorainfracloud.org/coprs/nalimilan/julia/repo/epel-7/nalimilan-julia-epel-7.repo -O /etc/yum.repos.d/nalimilan-julia-epel-7.repo"
sudo su - -c "yum -y install julia"
# c++ needed by ZMQ build
sudo su - -c "yum -y install gcc-c++"
sudo su - -c "yum -y install czmq"
sudo su - -c "yum -y install python3*-pip"
julia -e 'Pkg.add("ZMQ")'
# https://github.com/JuliaLang/IJulia.jl/issues/551
julia -e 'Pkg.add("IJulia")'
PYTHON='' julia -e 'Pkg.add("PyPlot")'
julia -e 'Pkg.add("Interact")'
# pywidgets 5 require Interact master branch https://github.com/JuliaLang/Interact.jl/issues/91
julia -e 'Pkg.checkout("Interact")'
