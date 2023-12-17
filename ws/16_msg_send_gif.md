# 16.发送:发送GIF

---

发送消息：发送聊天内容，也就是用户发言。

**注意：**

**1.发送此消息后，会收到 **[**收到聊天**](/ws/15..md)** 消息。**

**2.请求字段中的site\_id为网站ID，参考 **[**网站ID**](/ws.md)**。**

**3.此接口用户必须登录。**

**4.消息参数中的game\_type、room\_id、table\_id收到 **[**获取房间桌子数据**](/ws/02index_table_server.md)** 时得到。**

**5.单个用户每天最多发送50条消息（后端配置）。**

**6.单个用户每条消息间隔至少120秒（后端配置）。**

**7.快捷短语的模板为：\[dy1\]、\[dy2\]、\[dy3\]··· ··· 以此类推。**

* ##### 发送消息参数

| 参数名 | 参数类型 | 是否必填 | 描述 |
| :---: | :---: | :---: | :---: |
| type | String | 是 | 固定为：msg_send_gif |
| site\_id | String | 是 | 网站ID |
| client\_name | String | 是 | 用户名 |
| oid | String | 是 | 用户凭证 |
| game\_type | String | 是 | 游戏类型 |
| room\_id | String | 是 | 房间ID |
| table\_id | String | 是 | 桌子ID |
| msg | String | 是 | 聊天内容 |

* ##### 发送消息示例

```
{
  "type": "msg_send_gif",
  "client_name": "gjz001",
  "room_id": "9",
  "oid": "84424959a270b8d80e0c88e8db26b116",
  "table_id": "27",
  "site_id": "9000",
  "game_type": "keno28",
  "msg": [
    "https://worldimgs.oss-cn-beijing.aliyuncs.com/public/images/gif_emoticon/other/5.gif"
  ]
}
```



