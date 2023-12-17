# 04.收到：最新开奖数据

---

收到消息：得到最新的开奖数据；

**注意：**

**1.当前固定为10期；**

**2.这10期数据是连续的10期数据；**

**3.这10期数据可能中间有些期数没有开奖结果；**

**4.这10期数据中最新的一期可能不是当前开奖的最后一期；**

**5.发送 “**[**请求登录游戏房间**](/ws/03login.md)**” 消息后，会收到此消息；**

**6.当有新一期开奖数据时，服务器会主动推送此消息；**

* ##### **收到参数**

| 参数名 | 参数类型 | 是否必填 |      描述       |
| :----: | :------: | :------: | :-------------: |
| status |  String  |    是    |      code       |
|  type  |  String  |    是    | 固定为：lottery |
|  time  |   Long   |    是    |     时间戳      |
|  data  |  Object  |    是    |    返回信息     |

**data:**

|   参数名    | 参数类型 | 是否必填 |   描述   |
| :---------: | :------: | :------: | :------: |
|  closeTime  |  String  |    是    | 封盘时间 |
|    term     |  String  |    是    |   期数   |
| originalNum |  String  |    是    | 开奖号码 |
|    state    |  String  |    是    |   状态   |
|  openTime   |  String  |    是    | 开奖时间 |
|  billCount  |  String  |    是    | 下注人数 |
|  luckyNum   |  String  |    是    |   特码   |

* ##### **响应示例**

```
{
  "data": [
    {
      "originalNum": "939",
      "gameType": "fastbtb28",
      "billCount": "0",
      "closeTime": "1702347830000",
      "term": "202312120624",
      "state": "0",
      "openTime": "1702347840000",
      "luckyNum": "21"
    },
    {
      "originalNum": "074",
      "gameType": "fastbtb28",
      "billCount": "0",
      "closeTime": "1702347770000",
      "term": "202312120623",
      "state": "0",
      "openTime": "1702347780000",
      "luckyNum": "11"
    },
    {
      "originalNum": "884",
      "gameType": "fastbtb28",
      "billCount": "0",
      "closeTime": "1702347710000",
      "term": "202312120622",
      "state": "0",
      "openTime": "1702347720000",
      "luckyNum": "20"
    },
    {
      "originalNum": "366",
      "gameType": "fastbtb28",
      "billCount": "0",
      "closeTime": "1702347650000",
      "term": "202312120621",
      "state": "0",
      "openTime": "1702347660000",
      "luckyNum": "15"
    },
    {
      "originalNum": "504",
      "gameType": "fastbtb28",
      "billCount": "0",
      "closeTime": "1702347590000",
      "term": "202312120620",
      "state": "0",
      "openTime": "1702347600000",
      "luckyNum": "9"
    },
    {
      "originalNum": "012",
      "gameType": "fastbtb28",
      "billCount": "0",
      "closeTime": "1702347530000",
      "term": "202312120619",
      "state": "0",
      "openTime": "1702347540000",
      "luckyNum": "3"
    },
    {
      "originalNum": "122",
      "gameType": "fastbtb28",
      "billCount": "0",
      "closeTime": "1702347470000",
      "term": "202312120618",
      "state": "0",
      "openTime": "1702347480000",
      "luckyNum": "5"
    },
    {
      "originalNum": "086",
      "gameType": "fastbtb28",
      "billCount": "0",
      "closeTime": "1702347410000",
      "term": "202312120617",
      "state": "0",
      "openTime": "1702347420000",
      "luckyNum": "14"
    },
    {
      "originalNum": "482",
      "gameType": "fastbtb28",
      "billCount": "0",
      "closeTime": "1702347350000",
      "term": "202312120616",
      "state": "0",
      "openTime": "1702347360000",
      "luckyNum": "14"
    },
    {
      "originalNum": "822",
      "gameType": "fastbtb28",
      "billCount": "0",
      "closeTime": "1702347290000",
      "term": "202312120615",
      "state": "0",
      "openTime": "1702347300000",
      "luckyNum": "12"
    }
  ],
  "time": 1702347884,
  "type": "lottery",
  "status": "10000"
}
```

* ##### status说明

| status | 说明 |
| :---: | :---: |
| 10000 | 获取成功 |
| 10020 | 数据为空 |
| 10040 | 系统错误 |
| 其他 | 失败. |



