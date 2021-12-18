
export JAVA_HOME=/usr/lib/jdk/java
echo $JAVA_HOME

export SPARK_DIST_CLASSPATH=$(hadoop classpath)
echo ${SPARK_DIST_CLASSPATH}

echo "start spark submit job"

echo "args: $1"

PWD='/home/data_tool/bd-spark/bd-spark-encrypt-shuffle'

cd $PWD

nohup /data/bluemoon/soft/spark/bin/spark-submit     --class cn.com.bluemoon.shardingsphere.custom.spark.shuffle.SparkEncryptShuffleCli     --master yarn     --deploy-mode client    --executor-memory 1G     --num-executors 10 --jars bd-spark-encrypt-shuffle-jar-with-dependencies.jar   bd-spark-encrypt-shuffle-jar-with-dependencies.jar $1 > spark-nohup.out 2>&1 &
 
echo "spark submit end"
 
