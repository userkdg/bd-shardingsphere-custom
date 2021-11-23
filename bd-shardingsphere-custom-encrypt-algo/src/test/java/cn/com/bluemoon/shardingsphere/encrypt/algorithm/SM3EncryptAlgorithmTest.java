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

import org.apache.shardingsphere.encrypt.spi.EncryptAlgorithm;
import org.apache.shardingsphere.infra.config.algorithm.ShardingSphereAlgorithmConfiguration;
import org.apache.shardingsphere.infra.config.algorithm.ShardingSphereAlgorithmFactory;
import org.apache.shardingsphere.spi.ShardingSphereServiceLoader;
import org.junit.Before;
import org.junit.Test;

import java.util.Properties;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.nullValue;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertThat;

public final class SM3EncryptAlgorithmTest {

    static {
        ShardingSphereServiceLoader.register(EncryptAlgorithm.class);
    }

    private EncryptAlgorithm encryptAlgorithm;

    @Before
    public void setUp() {
        Properties props = new Properties();
        encryptAlgorithm = ShardingSphereAlgorithmFactory
                .createAlgorithm(new ShardingSphereAlgorithmConfiguration("SM3", props),
                        EncryptAlgorithm.class);
    }

    @Test
    public void assertEncrypt() {
        assertThat(encryptAlgorithm.encrypt("18813975053"), is("bcfc95a20b0988c38c27b7d02fa52e0fc402bd8419ea4a6f7d355cc63bf75c70"));
        assertThat(encryptAlgorithm.encrypt(null), is(nullValue()));

        assertThat(encryptAlgorithm.decrypt("bcfc95a20b0988c38c27b7d02fa52e0fc402bd8419ea4a6f7d355cc63bf75c70"), is("bcfc95a20b0988c38c27b7d02fa52e0fc402bd8419ea4a6f7d355cc63bf75c70"));
        assertThat(encryptAlgorithm.decrypt("188****5053"), is("188****5053"));
        assertThat(encryptAlgorithm.decrypt(null), is(nullValue()));
    }


}
