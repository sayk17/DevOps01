echo "--------------------------------------------------------------"
echo "Number of Volumes: `eval df -h | sed -n 1!p | wc -l`"
echo "Volume Details: "
df -h --output=source,size,avail
echo "--------------------------------------------------------------"
echo "Number of CPUs/Core: `eval nproc`"
echo "CPU Details: "
cat /proc/cpuinfo
echo "---------------------------------------------------------------"
echo "Amount of RAM : `eval cat /proc/meminfo | awk '/MemTotal/ {print $2 $3}'`"
echo "---------------------------------------------------------------"
echo "Mac Address: `eval ifconfig eth0 | awk '/Link encap/ {print $5}'`"
echo "IP Address: `eval ifconfig eth0 | awk '/inet addr/ {print $2}' | sed 's/addr://g'`"
