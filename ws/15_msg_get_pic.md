# 15.收到:收到聊天

---

收到消息：收到聊天消息有两种情况，一是自己发的聊天消息，另一个是别人发的聊天消息；

**注意：**

**1.如果要收到自己的消息，需要先发送 **[**发送聊天**](/ws/14msg_send.md)** 消息；**

* ##### 收到消息**参数**

| 参数名 | 参数类型 | 是否必填 | 描述 |
| :---: | :---: | :---: | :---: |
| type | String | 是 | 固定为：msg_get_pic |
| status | String | 是 | 请参考[status说明](#status说明) |
| unique_id | String | 是 |           消息唯一id            |
| username | String | 是 | 用户名 |
| nickname | String | 是 | 昵称 |
| msg | String | 是 | 聊天内容 |
| site_id | String | 是 | 网站id |
| avatar | String | 是 | 头像 |
| time | String | 是 | 消息时间戳 |
| table_id | String | 是 | 桌子id |

* ##### 收到消息**示例**

```
{
  "msg": [
    "各位PC小王子、小公举们...13"
  ],
  "unique_id": "36044276fbf797fc7ea1e4d580808512",
  "nickname": "gjz001",
  "site_id": "9000",
  "avatar": "f22",
  "time": 1702351289,
  "type": "msg_get_pic",
  "table_id": "27",
  "username": "gjz001",
  "status": 10000
}
```

* ##### status说明

| status | 表达含义 | 提示文案 | APP处理 |
| :---: | :---: | :---: | :---: |
| 10000 | 发送成功 | / | 展示在消息列表 |
| 10001 | 超过每日最多 | 发送失败，每日最多发送x条消息 | 对话框展示 |
| 10002 | 低于每次发送间隔 | 发送失败，每条消息间隔至少x秒 | 对话框展示 |



