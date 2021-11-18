### 自定义代理用户授权插件

- 目前原生实现有：NATIVE、ALL_PRIVILEGES_PERMITTED、SCHEMA_PRIVILEGES_PERMITTED
- 可以参考实现类：
 - org.apache.shardingsphere.authority.provider.natived.NativeAuthorityProviderAlgorithm
 - org.apache.shardingsphere.authority.provider.simple.AllPrivilegesPermittedAuthorityProviderAlgorithm
 - org.apache.shardingsphere.authority.provider.schema.SchemaPrivilegesPermittedAuthorityProviderAlgorithm
