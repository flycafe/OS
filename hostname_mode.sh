##########################################
# $Name:     hostname_mode.sh
# $Function: Change hostname by mode script
# $Versin:   V1.1
# $Author:   Yin Xi
# $Created:  2013-12-08
##########################################

usage(){
  echo "Usage: ./hostname_mode.sh MODE"
  echo "E.g: ./hostname_mode.sh ip"
  echo "  ip   : use ip address as hostname. eg:192-168-56-10"
  echo "  st   : use service tag as hostname"
  echo "  stip : use service tag + ip address as hostname. eg:D2BWQ02-192-168-56-10"
  echo "  free : type the hostname by yourself"
  exit 1
}


ip(){
   ip_addr=`hostname -I|cut -d ' ' -f 1`
   new_hostname=${ip_addr//./-}
}

st(){
  new_hostname=`dmidecode -s system-serial-number`
}

stip(){
   ip_addr=`hostname -I|cut -d ' ' -f 1`
   st=`dmidecode -s system-serial-number`
   new_hostname="${st}-${ip_addr//./-}"
   echo $new_hostname
}

free(){
  echo "please enter your new hostname:"
  read new_hostname
}

change(){
  sed -i.bak "/HOSTNAME/c\HOSTNAME=$new_hostname" /etc/sysconfig/network
  sed -i.bak "/127.0.0.1/c\127.0.0.1            localhost $new_hostname" /etc/hosts
  hostname $new_hostname
  echo "New hostname is: "`hostname`
"hostname_mode.sh" 71L, 1441C written
[root@localhost tmp]# clear
[root@localhost tmp]# 
[root@localhost tmp]# 
[root@localhost tmp]# 
[root@localhost tmp]# 
[root@localhost tmp]# cat hostname_mode.sh 
##########################################
# $Name:     hostname_mode.sh
# $Function: Change hostname by mode script
# $Versin:   V1.1
# $Author:   Yin Xi
# $Created:  2013-12-08
##########################################

usage(){
  echo "Usage: ./hostname_mode.sh MODE"
  echo "E.g: ./hostname_mode.sh ip"
  echo "  ip   : use ip address as hostname. eg:192-168-56-10"
  echo "  st   : use service tag as hostname"
  echo "  stip : use service tag + ip address as hostname. eg:D2BWQ02-192-168-56-10"
  echo "  free : type the hostname by yourself"
  exit 1
}


ip(){
   ip_addr=`hostname -I|cut -d ' ' -f 1`
   new_hostname=${ip_addr//./-}
}

st(){
  new_hostname=`dmidecode -s system-serial-number`
}

stip(){
   ip_addr=`hostname -I|cut -d ' ' -f 1`
   st=`dmidecode -s system-serial-number`
   new_hostname="${st}-${ip_addr//./-}"
   echo $new_hostname
}

free(){
  echo "please enter your new hostname:"
  read new_hostname
}

change(){
  sed -i.bak "/HOSTNAME/c\HOSTNAME=$new_hostname" /etc/sysconfig/network
  sed -i.bak "/127.0.0.1/c\127.0.0.1            localhost $new_hostname" /etc/hosts
  hostname $new_hostname
  echo "New hostname is: "`hostname`
}

main(){
   case $1 in 
     ip)
          ip
          change
          ;;
     st)
          st
          change
          ;;
     stip)
          stip
          change
          ;;
     free) 
          free
          change
          ;;
     *)
          usage
   esac
}

main $1
