# skip if already installed
if test -d /root/.julia; then exit 0; fi
yum clean all
if `cat /etc/redhat-release | grep -qi 'release 7'` && ! rpm -q epel-release; then yum -y install https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-10.noarch.rpm; fi
wget -q https://copr.fedorainfracloud.org/coprs/nalimilan/julia/repo/epel-7/nalimilan-julia-epel-7.repo -O /etc/yum.repos.d/nalimilan-julia-epel-7.repo
yum -y install julia
# c++ needed by ZMQ build
yum -y install gcc-c++
yum -y install czmq
julia -e 'Pkg.add("ZMQ")'
julia -e 'Pkg.add("IJulia")'
PYTHON='' julia -e 'Pkg.add("PyPlot")'
julia -e 'Pkg.add("Interact")'
# pywidgets 5 require Interact master branch https://github.com/JuliaLang/Interact.jl/issues/91
julia -e 'Pkg.checkout("Interact")'
