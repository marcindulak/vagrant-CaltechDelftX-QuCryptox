if ! test -f /etc/systemd/system/IJulia.service;
then
    cp -pf /vagrant/IJulia.service /etc/systemd/system
    systemctl daemon-reload
fi
