# kjyw 快捷运维

- 相关使用文档：https://bbs.aqzt.com/forum-39-1.html


## 使用场景
- 【举个例子】
- 某天，某人，因某业务，有redis部署需求，需要批量部署一组redis服务，端口从8001到8005，
- 简单，马上开始部署，编译redis，拷贝redis执行文件，配置文件，8001端口，启动，再拷贝redis执行文件，修改配置文件，8002…………
- 半小时后部署好了，完成！
- 有没有更好的方法，可以提高效率，快速完成呢？
- 如果用脚本部署，只需要1分钟搞定，主要是编译redis时间，大大提高效率，快捷，快捷，快捷啊！
- 第一步 编译redis
- curl -s https://raw.githubusercontent.com/kernespring/kjyw/master/redis/install.sh | sh
- 第二步 拷贝redis执行文件，修改配置文件，并启动
- curl -s https://raw.githubusercontent.com/kernespring/kjyw/master/redis/redis_port.sh | sh -s  install 8001 8005
- 完成！
- 批量关闭redis端口 8001到8009
- curl -s https://raw.githubusercontent.com/kernespring/kjyw/master/redis/redis_port.sh  | sh -s  stop 8001 8005
- 批量启动redis端口 8001到8009
- curl -s https://raw.githubusercontent.com/kernespring/kjyw/master/redis/redis_port.sh  | sh -s  start 8001 8005


