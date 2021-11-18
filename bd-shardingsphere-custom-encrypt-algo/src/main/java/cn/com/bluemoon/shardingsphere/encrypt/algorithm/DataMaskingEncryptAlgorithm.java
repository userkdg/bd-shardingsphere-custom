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

import cn.hutool.core.util.DesensitizedUtil;
import cn.hutool.core.util.DesensitizedUtil.DesensitizedType;
import com.google.common.base.Preconditions;
import lombok.Getter;
import lombok.Setter;
import lombok.SneakyThrows;
import org.apache.shardingsphere.encrypt.spi.EncryptAlgorithm;

import java.util.Properties;

/**
 * 脱敏算法
 * 写入不脱敏（数据库明文），查询脱敏
 *
 * <pre>
 *         data_masking:
 *         type: DATA_MASKING
 *         props:
 *            data_masking_format: MOBILE_PHONE
 * </pre>
 * data masking algorithm.
 */
@Setter
@Getter
public final class DataMaskingEncryptAlgorithm implements EncryptAlgorithm {

    private static final String DATA_MASKING_TYPE = "data_masking_type";

    private static final String DATA_MASKING_NAME = "DATA_MASKING";

    private Properties props = new Properties();

    @Override
    public void init() {
        Preconditions.checkArgument(props.containsKey(DATA_MASKING_TYPE), "%s can not be null.", DATA_MASKING_TYPE);
    }

    @Override
    public String encrypt(final Object plaintext) {
        if (null == plaintext) {
            return null;
        }
        return String.valueOf(plaintext);
    }

    @Override
    @SneakyThrows(IllegalArgumentException.class)
    public Object decrypt(final String ciphertext) {
        if (null == ciphertext) {
            return null;
        }
        DesensitizedType type = DesensitizedType.valueOf(props.getProperty(DATA_MASKING_TYPE));
        return DesensitizedUtil.desensitized(ciphertext, type);
    }

    @Override
    public String getType() {
        return DATA_MASKING_NAME;
    }
}
