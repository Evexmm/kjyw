TOMCAT_VERSION="apache-tomcat-8.5.34"
TOMCAT_HOME="/home/websoft/apache-tomcat-8.5.34"
cd /home/websoft
wget https://mirrors.cnnic.cn/apache/tomcat/tomcat-8/v8.5.34/bin/$TOMCAT_VERSION.tar.gz
tar zxvf $TOMCAT_VERSION.tar.gz

sed -i "export JRE_HOME=/usr/local/java/jdk1.8.0_144/jre" $TOMCAT_HOME/bin/catalina.sh 
sed -i "export JAVA_HOME=/usr/local/java/jdk1.8.0_144" $TOMCAT_HOME/bin/catalina.sh  

  cat > /usr/lib/systemd/system/tomcat8.service <<EOF
[Unit]
Description=Tomcat8.5.34
After=syslog.target network.target remote-fs.target nss-lookup.target

[Service]
Type=oneshot
ExecStart=/home/websoft/apache-tomcat-8.5.34/bin/startup.sh
ExecReload=/bin/kill -s HUP
ExecStop=/home/websoft/apache-tomcat-8.5.34/bin/shutdown.sh
PrivateTmp=true

[Install]
WantedBy=multi-user.target
EOF
chmod 754 /usr/lib/systemd/system/tomcat8.service
systemctl enable tomcat8.service
systemctl start tomcat8.service
