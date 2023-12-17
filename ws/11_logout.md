# 11.收到:被踢出房间

---

收到消息：用户被踢出房间。

* ##### 收到消息**参数**

| 参数名 | 参数类型 | 是否必填 | 描述 |
| :---: | :---: | :---: | :---: |
| type | String | 是 | 固定为：logout |
| reason | String | 是 | 被踢出原因 |

* ##### 收到消息**示例**

```
{
  "type": "logout",
  "from_client_id": "ac190a2d08fc00000006",
  "client_name": "test654321",
  "time": "1702351289",
  "reason": "\u7528\u6237\u4e0d\u5408\u6cd5\u6216\u7528\u6237\u4f1a\u8bdd\u671f\u5df2\u7ecf\u8fc7\u671f"
}
```



