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

package cn.com.bluemoon.shardingsphere.authority.aglo.schema;

import com.google.common.base.Preconditions;
import org.apache.shardingsphere.authority.model.AccessSubject;
import org.apache.shardingsphere.authority.model.PrivilegeType;
import org.apache.shardingsphere.authority.model.ShardingSpherePrivileges;
import org.apache.shardingsphere.authority.provider.schema.SchemaPrivilegesPermittedAuthorityProviderAlgorithm;
import org.apache.shardingsphere.authority.provider.schema.builder.SchemaPrivilegeBuilder;
import org.apache.shardingsphere.authority.spi.AuthorityProvideAlgorithm;
import org.apache.shardingsphere.infra.metadata.ShardingSphereMetaData;
import org.apache.shardingsphere.infra.metadata.user.Grantee;
import org.apache.shardingsphere.infra.metadata.user.ShardingSphereUser;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 基于{@see SchemaPrivilegesPermittedAuthorityProviderAlgorithm}和{@see AllPrivilegesPermittedShardingSpherePrivileges}
 * 增加root@=*，支持该用户获取所有的schema访问权限
 * <pre>
 *     user-schema-mappings='root@%=*,user1@localhost=db1,user2@%=db2'
 * </pre>
 */
public final class SchemaPrivilegesPermittedAuthorityProviderCustomAlgorithm implements AuthorityProvideAlgorithm {

    public static final String PROP_USER_SCHEMA_MAPPINGS = SchemaPrivilegesPermittedAuthorityProviderAlgorithm.PROP_USER_SCHEMA_MAPPINGS;

    private static final AllPrivilegesPermittedShardingSpherePrivileges ALL_PRIVILEGES_PERMITTED_SHARDING_SPHERE_PRIVILEGES = new AllPrivilegesPermittedShardingSpherePrivileges();

    private final Map<ShardingSphereUser, ShardingSpherePrivileges> userPrivilegeMap = new ConcurrentHashMap<>();

    private Properties props;

    private static void checkSchemas(final String mappingProp) {
        Preconditions.checkArgument(!"".equals(mappingProp), "user-schema-mappings configuration `%s` can not be null", mappingProp);
        Arrays.stream(mappingProp.split(",")).forEach(each -> Preconditions.checkArgument(0 < each.indexOf("@") && 0 < each.indexOf("="),
                "user-schema-mappings configuration `%s` is invalid, the configuration format should be like `username@hostname=schema`", each));
    }

    private static Map<ShardingSphereUser, Set<String>> convertSchemas(final String mappingProp) {
        String[] mappings = mappingProp.split(",");
        Map<ShardingSphereUser, Set<String>> result = new HashMap<>(mappings.length, 1);
        Arrays.asList(mappings).forEach(each -> {
            String[] userSchemaPair = each.trim().split("=");
            String yamlUser = userSchemaPair[0];
            String username = yamlUser.substring(0, yamlUser.indexOf("@"));
            String hostname = yamlUser.substring(yamlUser.indexOf("@") + 1);
            ShardingSphereUser shardingSphereUser = new ShardingSphereUser(username, "", hostname);
            Set<String> schemas = result.getOrDefault(shardingSphereUser, new HashSet<>());
            schemas.add(userSchemaPair[1]);
            result.putIfAbsent(shardingSphereUser, schemas);
        });
        return result;
    }

    @Override
    public Properties getProps() {
        return props;
    }

    @Override
    public void setProps(final Properties props) {
        this.props = props;
    }

    /**
     * @param mataDataMap Map, k schemaName v metadata
     * @param users       user list
     */
    @Override
    public void init(final Map<String, ShardingSphereMetaData> mataDataMap, final Collection<ShardingSphereUser> users) {
        buildUserPrivileges(users);
    }

    @Override
    public void refresh(final Map<String, ShardingSphereMetaData> mataDataMap, final Collection<ShardingSphereUser> users) {
        buildUserPrivileges(users);
    }

    @Override
    public Optional<ShardingSpherePrivileges> findPrivileges(final Grantee grantee) {
        return userPrivilegeMap.keySet().stream().filter(each -> each.getGrantee().equals(grantee)).findFirst().map(userPrivilegeMap::get);
    }

    @Override
    public String getType() {
        return "SCHEMA_PRIVILEGES_PERMITTED_CUSTOM";
    }

    private void buildUserPrivileges(Collection<ShardingSphereUser> users) {
        String mappingProp = props.getProperty(SchemaPrivilegesPermittedAuthorityProviderAlgorithm.PROP_USER_SCHEMA_MAPPINGS, "");
        checkSchemas(mappingProp);
        Map<ShardingSphereUser, Set<String>> userSchemaMappings = convertSchemas(mappingProp);
        userSchemaMappings.forEach((k, v) -> {
            if (v.contains("*")) {
                userPrivilegeMap.put(k, ALL_PRIVILEGES_PERMITTED_SHARDING_SPHERE_PRIVILEGES);
            } else {
                Map<ShardingSphereUser, ShardingSpherePrivileges> privilegesMap = SchemaPrivilegeBuilder.build(Collections.singleton(k), props);
                userPrivilegeMap.putAll(privilegesMap);
            }
        });
    }

    private static final class AllPrivilegesPermittedShardingSpherePrivileges implements ShardingSpherePrivileges {
        private AllPrivilegesPermittedShardingSpherePrivileges() {
        }

        public void setSuperPrivilege() {
        }

        public boolean hasPrivileges(String schema) {
            return true;
        }

        public boolean hasPrivileges(Collection<PrivilegeType> privileges) {
            return true;
        }

        public boolean hasPrivileges(AccessSubject accessSubject, Collection<PrivilegeType> privileges) {
            return true;
        }
    }
}
