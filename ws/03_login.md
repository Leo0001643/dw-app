# 03.发送:请求登录游戏房间

---

~~发送消息：发送登录游戏房间请求，可以获取最近十次开奖、以及投注限额等数据。~~

发送消息：发送登录游戏房间请求，可以获取最新开奖数据；

**注意：**

**1.发送此消息后，会收到 **[**最新开奖数据**](/ws/04zxkjsj.md)** 消息。**

**2.请求字段中的site\_id为网站ID，参考 **[**网站ID**](/ws.md)**。**

**3.用户未登录时为游客模式，client\_name生成规则参考 **[**游客模式**](/logic/16ykms.md)**。**

**4.请求参数中的game\_type、room\_id、table\_id收到 **[**获取房间桌子数据**](/ab/52hqfjzxsj.md)** 时得到。**

* ##### 发送消息参数

| 参数名 | 参数类型 | 是否必填 | 描述 |
| :---: | :---: | :---: | :---: |
| type | String | 是 | 固定为：login |
| site\_id | String | 是 | 网站ID |
| client\_name | String | 是 | 用户名 |
| oid | String | 是 | 用户凭证 |
| game\_type | String | 是 | 游戏类型 |
| room\_id | String | 是 | 房间ID |
| table\_id | String | 是 | 桌子ID |

* ##### 发送消息示例

```
{
  "type": "login",
  "site_id": "8000",
  "client_name": "test111111",
  "oid": "54927a364182f160961a6c27ac1a2635",
  "game_type": "xy28",
  "room_id": "7",
  "table_id": "16"
}
```


