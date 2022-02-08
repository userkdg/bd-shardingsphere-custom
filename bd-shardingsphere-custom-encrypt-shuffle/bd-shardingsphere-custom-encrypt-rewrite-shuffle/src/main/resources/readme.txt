
## 本地模式spark操作hdfs和hive
git clone https://github.com/userkdg/winutils.git

# window系统配置环境
HADOOP_HOME=D:\jarodkong\winutils\hadoop-2.6.4

PATH变量
增加：%HADOOP_HOME%\bin

重启电脑

# pom 依赖
```
<dependency>
    <groupId>org.apache.spark</groupId>
    <artifactId>spark-hive_${scala.version}</artifactId>
    <version>${spark.version}</version>
    <scope>provided</scope>
</dependency>
```

# 远程hdfs和hive环境 （远程hadoop、cdh环境配置文件）
core-site.xml、hdfs-site.xml、hive-site.xml
# 日志打印：
log4j.properties




