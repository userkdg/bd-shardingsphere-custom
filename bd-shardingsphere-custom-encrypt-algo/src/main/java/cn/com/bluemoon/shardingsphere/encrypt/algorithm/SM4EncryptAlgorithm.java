/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package cn.com.bluemoon.shardingsphere.encrypt.algorithm;

import cn.hutool.core.codec.Base64;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.symmetric.SM4;
import cn.hutool.crypto.symmetric.SymmetricCrypto;
import com.google.common.base.Preconditions;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shardingsphere.encrypt.spi.EncryptAlgorithm;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Properties;

import static cn.hutool.crypto.Mode.CBC;
import static cn.hutool.crypto.Padding.ZeroPadding;

/**
 * <pre>
 *       sm4_encrypt:
 *         type: SM4
 *         props:
 *            sm4-key-value: abc123456cba
 *            sm4-iv-value: bluemooniviviviv
 * </pre>
 * SM4
 */
@Setter
@Getter
public final class SM4EncryptAlgorithm implements EncryptAlgorithm {

    private static final String KEY_VALUE = "sm4-key-value";

    /**
     * salt
     */
    private static final String IV_VALUE = "sm4-iv-value";

    private static final String NAME = "SM4";
    // 默认
    private static final String IV_DEFAULT_VALUE = "bluemooniviviviv";

    private byte[] secretKey;

    private byte[] ivValue;

    private Properties props = new Properties();

    @Override
    public void init() {
        secretKey = createSecretKey();
        ivValue = createIvValue();
    }

    private byte[] createIvValue() {
        String ivValue = props.getProperty(IV_VALUE);
        if (StrUtil.isNotBlank(ivValue)) {
            Preconditions.checkArgument(ivValue.length() == IV_DEFAULT_VALUE.length(), "%s length must eq %s.", IV_VALUE, IV_DEFAULT_VALUE.length());
            return ivValue.getBytes(StandardCharsets.UTF_8);
        }
        return IV_DEFAULT_VALUE.getBytes(StandardCharsets.UTF_8);
    }

    private byte[] createSecretKey() {
        Preconditions.checkArgument(props.containsKey(KEY_VALUE), "%s can not be null.", NAME);
        return Arrays.copyOf(DigestUtils.sha1(props.getProperty(KEY_VALUE)), 16);
    }

    @Override
    public String encrypt(final Object plaintext) {
        if (null == plaintext) {
            return null;
        }
        SymmetricCrypto sm4 = createSm4();
        byte[] cipher = sm4.encrypt(String.valueOf(plaintext));
        return Base64.encode(cipher);
    }

    private SymmetricCrypto createSm4() {
        return new SM4(CBC, ZeroPadding, secretKey, ivValue);
    }

    @Override
    public Object decrypt(final String ciphertext) {
        if (null == ciphertext) {
            return null;
        }
        SymmetricCrypto sm4 = createSm4();
        byte[] plainText = sm4.decrypt(ciphertext);
        return new String(plainText, StandardCharsets.UTF_8);
    }

    @Override
    public String getType() {
        return NAME;
    }
}
