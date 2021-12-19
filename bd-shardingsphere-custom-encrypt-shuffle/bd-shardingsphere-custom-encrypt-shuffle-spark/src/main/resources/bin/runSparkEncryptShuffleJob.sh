
export JAVA_HOME=/usr/lib/jdk/java
echo $JAVA_HOME

export SPARK_DIST_CLASSPATH=$(hadoop classpath)
echo ${SPARK_DIST_CLASSPATH}

echo "start spark submit job"

echo "main json params arg1: $1"

echo "job name arg2: $2"

PWD='/home/data_tool/bd-spark/bd-spark-encrypt-shuffle'

cd $PWD

nohup /data/bluemoon/soft/spark/bin/spark-submit     --class cn.com.bluemoon.shardingsphere.custom.spark.shuffle.SparkEncryptShuffleCli     --master yarn     --deploy-mode client    --executor-memory 5G     --num-executors 30 --executor-cores 5  --jars bd-spark-encrypt-shuffle-jar-with-dependencies.jar   bd-spark-encrypt-shuffle-jar-with-dependencies.jar $1 > spark-encrypt-nohup-$2.out 2>&1 &
 
echo "spark submit end"
 
