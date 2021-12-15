package cn.com.bluemoon.shardingsphere.custom.shuffle.base.ssh.valueobject;

import lombok.Builder;
import lombok.Getter;

/**
 * @author Jarod.Kong
 **/
@Builder
@Getter
public class PtSsh {
    private final String host, username, password;
    private final int port;

}
