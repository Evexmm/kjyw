
#create java dir
java_file="/usr/local/java"

if [ ! -d $java_file ];
then
 mkdir $java_file
fi

cd /usr/local/java


if [ ! -f "jdk-8u202-linux-x64.tar.gz" ];
then
 wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn/java/jdk/8u202-b08/1961070e4c9b4e26a04e7f5a083f551e/jdk-8u202-linux-x64.tar.gz

fi


if [ ! -d "jdk1.8.0_202" ];
then
 tar -xvf jdk-8u202-linux-x64.tar.gz
fi


#set environment
export JAVA_HOME="/usr/local/java/jdk1.8.0_202"
if ! grep "JAVA_HOME=/usr/local/java/jdk1.8.0_202" /etc/profile
then
	echo "export JAVA_HOME=/usr/local/java/jdk1.8.0_202" | sudo tee -a  /etc/profile
	echo "export PATH=\$PATH:\$JAVA_HOME/bin" | sudo tee -a /etc/profile
	echo "export CLASSPATH=.:\$JAVA_HOME/jre/lib/rt.jar:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar" | sudo tee -a /etc/profile
fi
	
source /etc/profile
echo "jdk1.8.0_202 is installed !"
