#!/bin/bash
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

SERVER_NAME=bd-spark-encrypt-shuffle-job

cd $(dirname $0)
cd ..
DEPLOY_DIR=$(pwd)

print_usage() {
  echo "usage: start.sh [args]"
  echo "  args: spark jar args , default is {}"
  exit 0
}

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  print_usage
fi

echo "Starting the $SERVER_NAME ..."

if [ $# == 1 ]; then
  MAIN_CLASS=${MAIN_CLASS}" "$1
  echo "The args is $1"
fi

export SPARK_HOME=/data/bluemoon/soft/spark

MAIN_CLASS=cn.com.bluemoon.shardingsphere.custom.spark.shuffle.EncryptShuffleCliV2

# eg:  /data/bluemoon/soft/spark/bin/spark-submit     --class cn.com.bluemoon.shardingsphere.custom.spark.shuffle.EncryptShuffleCliV2     --master yarn     --deploy-mode client    --executor-memory 1G     --num-executors 10 --jars bd-spark-encrypt-shuffle-jar-with-dependencies.jar   bd-spark-encrypt-shuffle-jar-with-dependencies.jar "-c {\"sourceUrl\":\"jdbc:mysql://192.168.234.4:3304/db_for_sharding_1?user=ds_sync_struct&password=JmMBtXTz\",\"targetUrl\":\"jdbc:mysql://192.168.234.4:3304/db_for_sharding_1?user=ds_sync_struct&password=JmMBtXTz\",\"ruleTableName\":\"t_user_info_encrypt_v3\",\"primaryCols\":[{\"name\":\"id\"}],\"onYarn\":true,\"jobName\":\"bd-spark-encrypt-shuffle-t_user_info_encrypt_v3\",\"plainCols\":[{\"name\":\"password\",\"encryptRule\":{\"type\":\"AES\",\"props\":{\"aes-key-value\":\"123456abc\"}}},{\"name\":\"account\",\"encryptRule\":{\"type\":\"AES\",\"props\":{\"aes-key-value\":\"123456abc\"}}}],\"shuffleMode\":\"ReShuffle\",\"multiBatchUrlConfig\":false}"

${SPARK_HOME}/bin/spark-submit \
--class ${MAIN_CLASS} \
--master yarn \
--deploy-mode client \
--executor-memory 1G \
--num-executors 10 \
${DEPLOY_DIR}/bd-spark-encrypt-shuffle-jar-with-dependencies.jar \
$1
