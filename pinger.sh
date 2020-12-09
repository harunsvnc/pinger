
##author harunsvnc
##version 1.0
##################################for parameters#########################
if [ "$#" -ne "2" ]; then
echo "Error. please check your spelling "
echo "usage:$0 -h <ip_address of host> or $0 -f file.txt"
exit 0
fi
#################################for usage##############################
 if [ $1 =="-h" or $1 == "--help" ]; then
echo "Usage:<$0> < parameter>"
echo "-h or --help: see this manual"
echo "-d or --dhost : send packet to one host"
echo "-f or --file: send to  multiple adress from a file"
echo "examples: pinger -h 192.168.1.1 or pinger -f iplist.txt"
fi


######################################for -s###########################
if [ $1 == "-d" or $1 == "--dhost"  ]; then
if [[ $2  =~  ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
ping -c1 $2 &>/dev/null
if  [ $? -eq 0 ]
then
echo "host:$2 --> is up"
else
echo "host:$2 --> is down"
fi
else
echo "incorrect ip format see $0 --help"
fi
fi
##############################################for -f #######################
if [ $1 == "-f" or $1 == "--file"  ]; then
if [ !  -f $2 ]; then
echo "please specify the file that contains ip addresses.!!"
exit 0
fi
file =$2;
while read line
do 
if [[ $line =~  ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
ping -c1 $line &>/dev/null
if  [ $? -eq 0 ]

then
echo "host:$line --> is up"
else
echo "host:$line --> is down"
fi  ##eq 0
else
echo "check your ip format"
fi   ##for regex
done <$file

fi ##-f
***
