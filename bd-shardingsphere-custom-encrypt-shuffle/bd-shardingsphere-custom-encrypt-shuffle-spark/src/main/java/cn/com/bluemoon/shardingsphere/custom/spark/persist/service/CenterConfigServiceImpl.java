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

package cn.com.bluemoon.shardingsphere.custom.spark.persist.service;

import cn.com.bluemoon.shardingsphere.custom.spark.persist.domain.CenterConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.persist.domain.CenterConfigs;
import cn.com.bluemoon.shardingsphere.custom.spark.persist.repository.CenterConfigsRepository;

import java.util.Optional;

/**
 * Implementation of Center config service.
 */
public final class CenterConfigServiceImpl implements CenterConfigService {

    private final CenterConfigsRepository centerConfigsRepository;

    public CenterConfigServiceImpl(CenterConfigsRepository centerConfigsRepository) {
        this.centerConfigsRepository = centerConfigsRepository;
    }

    @Override
    public Optional<CenterConfig> loadActivated() {
        CenterConfigs centerConfigs = centerConfigsRepository.load();
        return centerConfigs.getCenterConfigs().stream().filter(CenterConfig::isActivated).findFirst();
    }

}
