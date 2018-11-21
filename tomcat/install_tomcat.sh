TOMCAT_VERSION="apache-tomcat-8.5.34"
TOMCAT_HOME="/home/websoft/apache-tomcat-8.5.34"
cd /home/websoft
wget https://mirrors.cnnic.cn/apache/tomcat/tomcat-8/v8.5.34/bin/$TOMCAT_VERSION.tar.gz
tar zxvf $TOMCAT_VERSION.tar.gz

echo "export JAVA_HOME=/usr/local/java/jdk1.8.0_144" >> $TOMCAT_HOME/bin/catalina.sh
  cat > /usr/lib/systemd/system/tomcat8.service <<EOF
[Unit]
Description=Tomcat
After=syslog.target network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
PIDFile=$TOMCAT_HOME/tomcat.pid
ExecStart=$TOMCAT_HOME/bin/startup.sh
ExecReload=/bin/kill -s HUP $MAINPID
ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target
EOF

systemctl enable tomcat8.service
systemctl start tomcat8.service
