# Tämä on esimerkki pilari käyttäjistä. /srv/pillar/users.sls

users:
  Matti:
    ssh_key: "ssh-rsa AAAA... matti@matinkone"
    shell: "/bin/bash"
    home: "/home/matti"
  Teppo:
    ssh_key: "ssh-rsa AAAA... teppo@hallinto"
    shell: "/bin/bash"
    home: "/home/teppo"
