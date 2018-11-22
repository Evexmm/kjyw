project_name=$1
project_port=$2

  cat > /home/websoft/java_jar/$project_name.sh <<EOF
#!/bin/sh
case "$1" in
start)
nohup java -jar /home/websoft/java_jar/$project_name/$project_name.jar --server.port=$project_port > /opt/data/logs/run/$project_name.log 2>&1&
;;
stop)
kill -9 `ps -ef|grep $project_port|grep -v grep|grep -v stop|awk '{print $2}'`
;;
restart)
kill -9 `ps -ef|grep $project_port|grep -v grep|grep -v stop|awk '{print $2}'`
nohup java -jar /home/websoft/java_jar/$project_name/$project_name.jar --server.port=$project_port > /opt/data/logs/run/$project_name.log 2>&1&
;;
esac
EOF


chmod 754 /home/websoft/java_jar/$project_name.sh

