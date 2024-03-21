


### 参考网站：http://soptj9qq.com/m/#/home

### 图标文件：
https://www.figma.com/team_invite/redeem/2TeFBk4OwM7y0FwXUmruLr

### git
https://github.com/Leo0001643/dw-app.git


https://9000vlmdm4.kj99883.com

wss://9000ywfjn2.uy4ayov.com:443

网页版的api 请求头 和websocket地址 有变动


# dart
dart pub run build_runner build

# flutter
flutter pub run build_runner build


测试文档：

https://docs.google.com/spreadsheets/d/1wZa11cDB_2ldGqhj7n0fwRjgJkav3ccKnKKCGZ_JE8k/edit?usp=sharing



1.需要优化走势页面的数据处理，把计算逻辑放到异步；
2.维护接口还有，网站是否开启了会员注册，代理注册功能，如果没有开启 是不允许会员注册的。



原有接口名：getVmDrawDetail  替换成:getDigitalWalletDrawDetail
请求报文不变，
绑定USDT 和绑定其它钱包，只需要调用这一个接口就可以拿到对应的字段， getUserDrawDetail 这个接口可以不用调用了。

===================================================

接口：getUserDrawDetail  
请求报文不变，返回报文添加所有数字钱包信息

===================================================
原有接口名：bindVmDrawDetail 替换成：bindDigitalWallet
接口参数：protocolType  修改成 bankCode
bankCode值=[USDT_TRC20,USDT_ERC20,USDT_OMNI,CGPAY,GOPAY,OKPAY,WEPAY,988PAY,KDPAY,EBPAY,ABPAY,BBPAY,CBPAY]

=======================
接口：getPaymentList
参数不变
返回结果区分普通支付通道，数字货币支付通道。

===============
接口： onlineDeposit
排除在线USDT入款都走这个接口



===========
接口：/takeSubmit
新增参数：bankCode ,参数值为接口getUserDrawDetail对应的type字段值，除去USDT ，cur字段都传默认值法币

测试账号：
24010202
aeuio888


bug系统：
http://8.210.163.128/

applance
19931125tu




