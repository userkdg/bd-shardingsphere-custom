## 洗数

### 流程
- 抽取
- 转换（加密、解密、重加密）
- 入库

### 细节

- 抽取

| 类型 | 类 | 描述 |
| ---- | ---- | ---- |
| All | SparkDbExtractAll | 全量抽取 |
| WithPersistStateCustomWhere | SparkDbExtractWithPersistStateCustomWhere | 自定义where抽取方式，带缓存抽取状态，且结合customExtractWhereSql字段来定义 |
| OtherCustom | SparkDbExtractCustom | 其他抽取方式，基于customExtractWhereSql字段来定义 |

#### 增量抽取

1. 支持增量的主键：自增id、雪花算法id（数值和字符串类型）、自定义数值带增量数值和数值字符串

2. 支持增量的非主键字段：目前支持时间戳类型（timestamp、date）的增量字段，强烈建议字段有创建索引，如：last_update_time

3. 强烈建议增量字段（主键、时间戳更新时间字段）都要有创建索引

4. 说明：优先选用带增量意义的主键进行增量洗数，其次，选用增量意义的更新时间字段，最后，无增量字段建议创建一个或者走全量抽取

#### 全量抽取
