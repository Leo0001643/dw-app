<!--
 * @Author: your name
 * @Date: 2022-02-23 14:39:53
 * @LastEditTime: 2022-03-25 15:33:33
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /aone_flutter/README.md
-->

<!--
                     _ooOoo_
                    o8888888o
                    88" . "88
                    (| -_- |)
                    O\  =  /O
                 ____/`---'\____
               .'  \\|     |//  `.
              /  \\|||  :  |||//  \
             /  _||||| -:- |||||-  \
             |   | \\\  -  /// |   |
             | \_|  ''\---/''  |   |
             \  .-\__  `-`  ___/-. /
           ___`. .'  /--.--\  `. . __
        ."" '<  `.___\_<|>_/___.'  >'"".
       | | :  `- \`.;`\ _ /`;.`/ - ` : | |
       \  \ `-.   \_ __\ /__ _/   .-` /  /
  ======`-.____`-.___\_____/___.-`____.-'======
                     `=---='
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
               佛祖保佑        永无BUG
        佛曰:
               写字楼里写字间，写字间里程序员；
               程序人员写程序，又拿程序换酒钱。
               酒醒只在网上坐，酒醉还来网下眠；
               酒醉酒醒日复日，网上网下年复年。
               但愿老死电脑间，不愿鞠躬老板前；
               奔驰宝马贵者趣，公交自行程序员。
               别人笑我忒疯癫，我笑自己命太贱；
               不见满街漂亮妹，哪个归得程序员？
-->

### 命令行启动说明

1. 初始化项目
    1. ```shell
       dart pub global activate melos
        ```
    2. 确认moles命令有效
       ```shell
       melos -v
       ```
        1. 若无法运行需添加环境变量
           ```text
             unix*
             export PATH=$HOME/.pub-cache/bin
             zsh
             export PATH="$PATH":"$HOME/.pub-cache/bin"
             
             Windows*
             %LOCALAPPDATA%\Pub\Cache\bin
           ```
    3. 在IDE的terminal中初始化项目melos
       > melos 会自动配置ide的debugger
       ```shell
       melos bs
       ```

### 文档结构说明

    |-- packages 
        |-- aone_widget ==> 可共用的自定义widget
        |-- common ==> 通用包
            |-- controller => 封装好的业务逻辑 不能满足需求可自建
            |-- core
                |-- base
                |-- fetch ==> dio
            |-- data 
                |-- local
                |-- model
                    |-- dto ==> 请求query/body dto
                    |-- entities ==> 服务端返回entities
                |-- remote
                    |-- provider ==> 远程接口数据provider
            |-- lang 语言文件
            |-- interfaces
            |-- router
            |-- service 公共service
            |-- utils
            common.dart ==> 引入这个就可以了
        |-- 其他 ==> 统一版面的活动模块
    |-- sites
        |-- e01 & etc...

### 状态管理 State Management

> https://1467602180.github.io/flutter-getx-doc/

### Api请求

> fetch 基于 dio 二次封装
> https://github.com/flutterchina/dio/blob/master/README-ZH.md

### 全局Toast loading

> 采用flutter_smart_dialog，库中包含可以定义的loading/dialog/toast
> 具体用法参考文档或者prototype
> https://github.com/fluttercandies/flutter_smart_dialog


### 表单及验证

> flutter_form_builder: ^7.1.1
> form_builder_validators: ^7.8.0
> https://pub.dev/packages/flutter_form_builder

### screenUtils 自适应布局

> 横屏版面统一按竖屏的时的宽度适配，否则将导致不同设备下宽度偏差过大问题



### Android打包签名jks

> anoe.jks为android打包的签名文件，在根目录下，所有Android均可用该签名文件进行打包，打包相关信息如下：
> KEYSTORE_FILE=./anoe.jks
> KEYSTORE_PASSWORD=123456
> KEY_ALIAS=key0
> KEY_PASSWORD=123456

