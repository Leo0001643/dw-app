
## 大转盘活动模块 FortuneWheel

## Features
根据达成的任务条件赠送抽奖次数，可配置奖金及奖品，发放方式：
1. 奖金：发放到活动福利中心，需自行点击领取;
2. 奖品：联系客服，由商户自行处理;

## Getting started
加入依赖之后运行melos bs
```yaml
dependencies:
  fortune_wheel:
    // 指向此package根目录的相对路径 relative path to this packages
    path: ../../packages/fortune_wheel
```

## Usage

> 暂时只实现了横版页面(弹窗展示形式);
> BoardRecord(抽奖记录)可单独展示;


```dart

/// 在 [GetMaterialApp]、[User
Service]、[Fetch]模块初始化完成之后初始化[FortuneWheelService]
void onInit() {
  Get.put(

    FortuneWheelService(
      // 回调为自行实现的widget
      toFortuneWheelPage: () => Get.dialog(const FortuneWheelPage()),
    ),
  );
}

/// 打开大转盘
/// 已封装好用户以及活动有效性功能 具体事件回调采用EventBus实现
void onToFortuneWheel() async {
  await FortuneWheelService.to.onBeforeEntry();
}

///横版 [FortuneWheelLandscape]
Widget build(BuildContext context) {
  return FortuneWheelLandscape(
    onClose: () => Get.back(),
  );
}

```

## Additional information

