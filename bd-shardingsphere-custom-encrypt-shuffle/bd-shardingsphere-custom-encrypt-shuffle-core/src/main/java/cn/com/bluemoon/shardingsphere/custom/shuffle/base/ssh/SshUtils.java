package cn.com.bluemoon.shardingsphere.custom.shuffle.base.ssh;

import lombok.extern.slf4j.Slf4j;
import org.apache.sshd.client.SshClient;
import org.apache.sshd.client.future.AuthFuture;
import org.apache.sshd.client.session.ClientSession;
import org.apache.sshd.common.channel.Channel;
import org.apache.sshd.common.channel.ChannelListener;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ssh.valueobject.PtSsh;

import java.io.IOException;
import java.util.Objects;

/**
 * <pre>
 *     cn.com.bluemoon.shardingsphere.custom.shuffle.base.ssh.SshUtils.client().sessionCall(session -> session.executeRemoteCommand(script))
 * </pre>
 *
 * @author Jarod.Kong
 * @see SshClient 描述可以知道： 多session 应用一个client
 **/
@Slf4j
public final class SshUtils {

    //  多session 应用一个client
    private final SshClient CLIENT;
    private PtSsh ptSsh;

    private SshUtils() {
        CLIENT = SshClient.setUpDefaultClient();
    }

    public static SshUtils client() {
        return new SshUtils();
    }

    /**
     * 自定义连接服务器信息,为空则获取默认的连接
     *
     * @param ptSsh 服务器信息 加密后的信息
     * @return this
     */
    public SshUtils sshInfo(PtSsh ptSsh) {
        this.ptSsh = ptSsh;
        return this;
    }

    public ClientSession initClientSession() {
        if (!CLIENT.isStarted()){
            CLIENT.start();
        }
        Objects.requireNonNull(ptSsh, "必须指定ssh服务器信息");
        // 多session 应用一个client
        ClientSession session = null;
        try {
            session = CLIENT.connect(ptSsh.getUsername(), ptSsh.getHost(), ptSsh.getPort())
                    .verify().getSession();
            session.addPasswordIdentity(getClass().getSimpleName());
            session.addPasswordIdentity(ptSsh.getPassword());
            AuthFuture verify = session.auth().verify();
            log.info("auth info : " + verify.isSuccess());
            session.addChannelListener(new ChannelListener() {
                @Override
                public void channelOpenSuccess(Channel channel) {
                    log.info("建管道成功，{}", channel);
                }

                @Override
                public void channelOpenFailure(Channel channel, Throwable reason) {
                    log.error("建管道fail，{}", channel, reason);
                }

                @Override
                public void channelClosed(Channel channel, Throwable reason) {
                    log.info("关闭：{}", channel, reason);
                }
            });
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("初始化client session异常！", e);
        }
        return session;
    }

    /**
     * 无返回
     *
     * @param callback c
     */
    public void session(Callback callback) {
        CLIENT.start();
        try (ClientSession session = initClientSession()) {
            callback.run(session);
        } catch (IOException e) {
            log.error("初始化client Session异常", e);
            throw new RuntimeException("初始化client Session异常", e);
        } finally {
            CLIENT.stop();
        }
    }

    /**
     * 返回结果
     *
     * @param callback c
     * @param <T>      t
     * @return T
     */
    public <T> T sessionCall(ICallback<T> callback) throws IOException {
        CLIENT.start();
        try (ClientSession session = initClientSession()) {
            return callback.call(session);
        } finally {
            CLIENT.stop();
        }
    }

    /**
     * 执行shell命令+返回执行结果
     *
     * @return run msg
     */
    public boolean runScript(String script) {
        Objects.requireNonNull(script, "执行脚本不可为空");
        String res = "";
        boolean run = true;
        try {
            res = sessionCall(session -> session.executeRemoteCommand(script));
        } catch (Exception e) {
            log.error("执行shell={}失败！", script, e);
            run = false;
            res = e.getMessage();
        } finally {
            log.info("执行shell={},status={}", script, run);
        }
        log.info("res:{}", res);
        return run;
    }

    /**
     * 定义无返回值
     */
    @FunctionalInterface
    public interface Callback {
        void run(ClientSession session);
    }

    /**
     * 定义有返回值
     *
     * @param <T> t
     */
    @FunctionalInterface
    public interface ICallback<T> {
        T call(ClientSession session) throws IOException;
    }

}
