project_name=$1
  cat > /home/websoft/java_jar/$project_name_run.sh <<EOF
#!/bin/sh

export JAVA_HOME=/usr/local/java/jdk1.8.0_131
export PATH=$JAVA_HOME/bin:$PATH
java -jar /home/websoft/java_jar/$project_name/$project_name.jar > /opt/data/logs/run/$project_name.log &
EOF

  cat > /usr/lib/systemd/system/$project_name.service <<EOF
[Unit]
Description=$project_name.service for $project_name
After=syslog.target network.target remote-fs.target nss-lookup.target
 
[Service]
Type=forking
ExecStart=/home/websoft/java_jar/$project_name_run.sh
PrivateTmp=true
 
[Install]
WantedBy=multi-user.target
EOF

chmod 754 /usr/lib/systemd/system/$project_name.service
chmod 754 /home/websoft/java_jar/$project_name_run.sh

systemctl daemon-reload
systemctl enable $project_name.service
systemctl start $project_name.service
