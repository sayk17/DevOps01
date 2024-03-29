#!/bin/sh
print_usage()
{

	echo "Usage: ./devops01b.sh [volumes] [cpu] [ram] [network] [all]" 
	echo "volumes: Displays number of volumes, size of each volume and free space on each volume"
	echo "cpu: Displays number of cpus/cores and their information"
	echo "ram: Displays amount of RAM"
	echo "network: Displays mac address and ip address"
	echo "all: Displays all information for volumes, cpu, ram and network"
}

if [ $# -lt 1 ] 
	then
		print_usage
		exit 1
fi


if [ $1 = "volumes" ] || [ $1 = "all" ]
	then
		echo "------------------------------- VOLUMES DETAILS ----------------------------------------"
		echo "Number of Volumes: `eval df -h | sed -n 1!p | wc -l`"
		echo "Volume Details: "
		df -h --output=source,size,avail
fi

if [ $1 = "cpu" ] || [ $1 = "all" ]
	then
		echo "------------------------------- CPU DETAILS --------------------------------------------"
		echo "Number of CPUs/Core: `eval nproc`"
		echo "CPU Details: "
		cat /proc/cpuinfo
fi

if [ $1 = "ram" ] || [ $1 = "all" ]
	then
		echo "------------------------------- RAM ----------------------------------------------------"
		echo "Amount of RAM : `eval cat /proc/meminfo | awk '/MemTotal/ {print $2 $3}'`"
fi
if [ $1 = "network" ] || [ $1 = "all" ]
	then
		echo "------------------------------- NETWORK DETAILS ----------------------------------------"
		echo "Mac Address: `eval ifconfig eth0 | awk '/Link encap/ {print $5}'`"
		echo "IP Address: `eval ifconfig eth0 | awk '/inet addr/ {print $2}' | sed 's/addr://g'`"
fi
exit 0

