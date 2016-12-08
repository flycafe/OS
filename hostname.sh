##########################################
# $Name:     hostname.sh
# $Function: Change hostname script
# $Versin:   V1.0
# $Author:   Yin Xi
# $Created:  2013-12-08
##########################################

usage(){
  echo "Usage: ./hostname.sh NEWHOSTNAME"
  echo "Example: ./hostname.sh testdb"
  exit 1
}

new_hostname=$1

change_hostname(){
  sed -i.bak "/HOSTNAME/c\HOSTNAME=$new_hostname" /etc/sysconfig/network
  sed -i.bak "/127.0.0.1/c\127.0.0.1            localhost $new_hostname" /etc/hosts
  hostname $new_hostname
  echo `hostname`
}

main(){
   if [ -z $1 ]
   then
       usage
   else
       change_hostname
   fi
}

main $1
