//package cn.com.bluemoon.shardingsphere.custom.cli;
//
//import cn.com.bluemoon.daps.common.toolkit.SshUtils;
//import cn.com.bluemoon.daps.common.toolkit.valueobject.PtSsh;
//import cn.hutool.extra.ssh.JschUtil;
//import com.jcraft.jsch.JSch;
//import com.jcraft.jsch.JSchException;
//import com.jcraft.jsch.Session;
//import org.junit.Test;
//import reactor.util.function.Tuple2;
//
///**
// * @author Jarod.Kong
// */
//public class RemoteRunSpark {
//    @Test
//    public void submitSpark() throws JSchException {
//        Session session = JschUtil.getSession( "192.168.235.12", 22, "data_tool","tool@aeb56");
//
//
//        PtSsh ptSsh = new PtSsh();
//        ptSsh.setHost("192.168.235.12");
//        ptSsh.setUsername("data_tool");
//        ptSsh.setPassword("tool@aeb56c");
//        ptSsh.setPort("22");
//
//        Tuple2<Boolean, String> objects =
//                SshUtils.client().sshInfo(ptSsh).runScript("ls -l /");
//
//
////        String script = "sh /home/data_tool/bd-spark/bd-spark-encrypt-shuffle/run-spark-client-local.sh \"-c {\"sourceUrl\":\"jdbc:mysql://192.168.234.4:3304/db_for_sharding_1?user=ds_sync_struct&password=JmMBtXTz\",\"targetUrl\":\"jdbc:mysql://192.168.234.4:3304/db_for_sharding_1?user=ds_sync_struct&password=JmMBtXTz\",\"ruleTableName\":\"t_user_info_encrypt_v3\",\"primaryCols\":[{\"name\":\"id\"}],\"onYarn\":false,\"jobName\":\"bd-spark-encrypt-shuffle-t_user_info_encrypt_v3\",\"plainCols\":[{\"name\":\"password\",\"encryptRule\":{\"type\":\"AES\",\"props\":{\"aes-key-value\":\"123456abc\"}}},{\"name\":\"account\",\"encryptRule\":{\"type\":\"AES\",\"props\":{\"aes-key-value\":\"123456abc\"}}}],\"shuffleMode\":\"ReShuffle\",\"multiBatchUrlConfig\":false}\"";
////        Tuple2<Boolean, String> objects =
////                SshUtils.client().sshInfo(ptSsh).runScript(script);
//        System.out.println(objects);
//    }
//}
