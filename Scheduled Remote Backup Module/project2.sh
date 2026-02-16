#!/bin/bash

filename="backup_`date +%d_%m_%Y_%H_%M_%S`.tar"

#tar command syntax
#tar options dest_file source_file/dir

tar -cvf /home/aryan23/Bash/topics/projects/backups/${filename} /home/aryan23/Bash/topics/if_fi

# -c -> compress
# -v -> verbose
# -f -> filename

: '
$ssh-keygen

$ssh-copy-id -i id_ed25519.pub username@ip_address 

'



scp /home/aryan23/Bash/topics/projects/backups/${filename} kali@172.16.17.72:~/Downloads

# $view file on server
# $tar -tf filename

#for check ssh serverice is enable or not on server
# $systemctl status ssh.service
# check passwordless authentications is enable -> /etc/ssh/d.confile 



# $ crontab -e
# $ */1 * * * * /home/aryan23/Bash/topics/projects/project2.sh

