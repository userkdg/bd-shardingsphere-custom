# sdk发布方式

描述：测试环境和生产环境发布sdk到公司私服上，提供应用下游作业进行解密

其中，测试环境和生产环境的秘钥是不一样的，因此在发布动作上也不一样（需要切换各环境的配置）

前提条件：命令行切换到当前项目目录下（bd-kms-center目录下）

测试发布环境如下：

mvn clean deploy -DskipTests=true -P encrypt-sdk-test

生产发布环境如下：

mvn clean deploy -DskipTests=true -P encrypt-sdk-prod


# 添加新的秘钥方式

参考单元测试类GenerateKmsConfigTest，用于生成测试环境和生产环境
