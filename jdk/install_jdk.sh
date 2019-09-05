
#create java dir
java_file="/usr/local/java"

if [ ! -d $java_file ];
then
 mkdir $java_file
fi

cd /usr/local/java


if [ ! -f "jdk-8u221-linux-x64.tar.gz" ];
then
 wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u221-linux-x64.tar.gz

fi


if [ ! -d "jdk1.8.0_221" ];
then
 tar -xvf jdk-8u221-linux-x64.tar.gz
fi


#set environment
export JAVA_HOME="/usr/local/java/jdk1.8.0_221"
if ! grep "JAVA_HOME=/usr/local/java/jdk1.8.0_221" /etc/profile
then
	echo "export JAVA_HOME=/usr/local/java/jdk1.8.0_221" | sudo tee -a  /etc/profile
	echo "export PATH=\$PATH:\$JAVA_HOME/bin" | sudo tee -a /etc/profile
	echo "export CLASSPATH=.:\$JAVA_HOME/jre/lib/rt.jar:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar" | sudo tee -a /etc/profile
fi
	
source /etc/profile
echo "jdk1.8.0_221 is installed !"
