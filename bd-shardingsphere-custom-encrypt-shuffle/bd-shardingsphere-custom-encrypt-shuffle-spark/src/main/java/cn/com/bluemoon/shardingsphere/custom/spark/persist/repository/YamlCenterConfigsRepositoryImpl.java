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

package cn.com.bluemoon.shardingsphere.custom.spark.persist.repository;


import cn.com.bluemoon.shardingsphere.custom.spark.persist.domain.CenterConfigs;
import lombok.extern.slf4j.Slf4j;
import org.yaml.snakeyaml.Yaml;
import org.yaml.snakeyaml.constructor.Constructor;

import java.io.*;
import java.nio.charset.StandardCharsets;

/**
 * Implementation of Center configs repository.
 */
@Slf4j
public final class YamlCenterConfigsRepositoryImpl implements CenterConfigsRepository {

    private File file;

    public YamlCenterConfigsRepositoryImpl() {
        try {
            this.file = new File(YamlCenterConfigsRepositoryImpl.class.getClassLoader().getResource("shardingsphere-configs.yaml").getFile());
        } catch (Exception e) {
            log.error("加载配置中心", e);
        }
    }
    
    public YamlCenterConfigsRepositoryImpl(File file){
        this.file = file;
    }

    @Override
    public CenterConfigs load() {
        if (!file.exists()) {
            return new CenterConfigs();
        }

        try (FileInputStream fileInputStream = new FileInputStream(file);
             InputStreamReader inputStreamReader = new InputStreamReader(fileInputStream, StandardCharsets.UTF_8)) {
            return new Yaml(new Constructor(CenterConfigs.class)).loadAs(inputStreamReader, CenterConfigs.class);
        } catch (IOException e) {
            throw new RuntimeException("load center config error", e);
        }

    }

    @Override
    public void save(final CenterConfigs centerConfigs) {
        Yaml yaml = new Yaml();
        try (BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(file))) {
            bufferedOutputStream.write(yaml.dumpAsMap(centerConfigs).getBytes());
            bufferedOutputStream.flush();
        } catch (IOException e) {
            throw new RuntimeException("save center config error", e);
        }
    }

}
