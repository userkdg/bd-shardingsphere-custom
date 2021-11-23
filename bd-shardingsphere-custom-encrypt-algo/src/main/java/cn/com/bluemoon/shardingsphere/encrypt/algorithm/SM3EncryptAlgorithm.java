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

import cn.hutool.crypto.SmUtil;
import lombok.Getter;
import lombok.Setter;
import org.apache.shardingsphere.encrypt.spi.EncryptAlgorithm;

import java.util.Properties;

/**
 * <pre>
 *      sm4_encrypt:
 *          type: SM3
 * </pre>
 * SM3 encrypt algorithm.
 */
@Getter
@Setter
public final class SM3EncryptAlgorithm implements EncryptAlgorithm {
    public static final String NAME = "SM3";

    private Properties props = new Properties();

    @Override
    public void init() {
    }

    @Override
    public String encrypt(final Object plaintext) {
        if (null == plaintext) {
            return null;
        }
        return SmUtil.sm3(String.valueOf(plaintext));
    }

    @Override
    public Object decrypt(final String ciphertext) {
        return ciphertext;
    }

    @Override
    public String getType() {
        return NAME;
    }
}
