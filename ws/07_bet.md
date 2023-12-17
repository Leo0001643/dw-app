# 07.发送:请求投注

---

发送消息：发送投注请求，也就是用户投注。

**注意：**

**1.发送此消息后，会收到 **[**投注结果**](/ws/08bet_result.md)** 消息。**

**2.请求字段中的site\_id为网站ID，参考 **[**网站ID**](/ws.md)**。**

**3.此接口用户必须登录。**

**4.消息参数中的game\_type、room\_id、table\_id收到 **[**获取房间桌子数据**](/ws/02index_table_server.md)** 时得到。**

**5.消息参数中的now\_term为投注期数，收到 **[**历史开奖和投注限额**](/ws/04lottery.md)** 时得到；**

**6.消息参数中的content为注单列表，一次可以下多个不同投注类型，但是金额是相同的；**

**7.注单列表中的type为投注类型，收到 **[**赔率数据**](/ws/06game_odds_server.md)** 消息时得到；**

**8.注单列表中的num为投注cao类型时的单点数字，只有当投注单点类型时有值，投注其他类型时传空字符串即可；**

**9.注单列表中的msg为投注消息，格式为：\[单点数字\]+\[投注类型名称\]+\[投注金额\]**

**10.投注类型无特殊赔率时，传空字符串，即“”；**

**其中：**

**单点数字只有投注类型为单点类型时有值；**

**投注类型名称分两种情况，当投注类型为常规类型时，使用 **[**赔率数据**](/ws/06game_odds_server.md)** 消息得到的投注类型名称；当投注类型为单点类型时，固定为“草”字；**

**投注金额就是money；**

例如：大13、极大31、红波10、0草15、24草1、27草17，也可参考下面发送消息示例；

* ##### 发送消息参数

| 参数名 | 参数类型 | 是否必填 | 描述 |
| :---: | :---: | :---: | :---: |
| type | String | 是 | 固定为：bet |
| site\_id | String | 是 | 网站ID |
| client\_name | String | 是 | 用户名 |
| oid | String | 是 | 用户凭证 |
| game\_type | String | 是 | 游戏类型 |
| room\_id | String | 是 | 房间ID |
| table\_id | String | 是 | 桌子ID |
| now\_term | String | 是 | 投注期数 |
| moneyType | String | 是 | 币种类型 |
| content | **JSONArray** | 是 | 注单列表，详情如下:↓ |
| type | String | 是 | 投注类型 |
| money | String | 是 | 投注金额 |
| num | String | 否 | 单点数字 |
| msg | String | 是 | 投注消息 |
| odds | String | 是 | 常规赔率 |
| odds\_1314 | String | 是 | 特殊赔率 |
|              |       a       |          |                      |

* ##### 发送消息示例

```
{
  "type": "bet",
  "client_name": "gjz001",
  "room_id": "9",
  "oid": "84424959a270b8d80e0c88e8db26b116",
  "table_id": "27",
  "site_id": "9000",
  "game_type": "keno28",
  "now_term": "3079375",
  "moneyType": "USDT",
  "content": [
    {
      "money": 5,
      "num": "",
      "odds": "1.881",
      "odds_1314": "1.888",
      "type": "big"
    },
    {
      "money": 5,
      "num": "",
      "odds": "1.882",
      "odds_1314": "1.777",
      "type": "small"
    }
  ]
}
```



