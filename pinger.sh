##author harunsvnc
##version 1.1
##################################for parameters#########################
if [ "$#" -ne "2" ]; then
echo "Error. please check your spelling "
echo "usage:$0 -d <ip_address of host> or $0 <-f> <file.txt>"
exit 0
fi

 if [[ ! $1 =~ ^("-h"|"--help"|"-d"|"--dhost"|"-f"|"--file")$ ]]; then
 echo "wrong parameter see $0 -h for help"
 exit 0
fi

#################################for usage##############################
 if [[ $1 =~ ^("h"|"--help")$ ]]; then
echo "Usage:<$0> < parameter>"
echo "-h or --help: see this manual"
echo "-d or --dhost : send packet to one host"
echo "-f or --file: send to  multiple adress from a file"
echo "examples: pinger -h 192.168.1.1 or pinger -f iplist.txt"
fi

##############################################define function and vars##########


#if [[ $2  =~  ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then


function hpinger() {
echo $host
 ping -c1 -w1 -i0.2 $host &>/dev/null
if  [ $? -eq 0 ]
then
echo "host:$host --> is up"
else
echo "host:$host--> is down"
fi
}
 function fpinger () {
 ping -c1 -w1 -i0.2 $line &>/dev/null
if  [ $? -eq 0 ]
then
echo "host:$line --> is up"
else
echo "host:$line --> is down"
fi
}
 function validate_ip() {

 if [[ ! $host =~  ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
   echo "$2"
   echo "incorrect ip format!!"
exit 0

  fi

}
function validate_file() {

if [[ ! -f $file ]]; then
 echo "file error, check your file!!"
exit 0;
fi
}

######################################for -s###########################
 if [[ $1 =~ ^("-d"|"--dhost")$ ]] ; then
  host=$2
  validate_ip;
 hpinger;
 elif [[ $1 =~ ^("-f"|"--file")$ ]] ; then
  file=$2
  validate_file; #check if file is exist
  while read line;
do
 fpinger;
done <$file

  fi

