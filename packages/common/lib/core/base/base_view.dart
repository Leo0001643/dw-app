import 'package:aone_common/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 自定义View模板 请勿直接使用
/// 应当在每个站点
abstract class BaseView<T extends BaseController> extends GetView<T> {

  const BaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.exception != null) {
        return exceptionWidget(context);
      } else if (controller.isPageLoading) {
        return loadingWidget(context);
      } else {
        return content(context);
      }
    });
  }

  // 由子类实现
  Widget content(BuildContext context);

  Widget exceptionWidget(BuildContext context) {
    return const Text('Has Error, click to retry');
  }

  Widget loadingWidget(BuildContext context) {
    return const Text('Loading...');
  }
}
