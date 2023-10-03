import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

void copyToClipboard(String? data) {
  try {
    Clipboard.setData(
      ClipboardData(text: data),
    ).then(
      (_) => SmartDialog.showToast('copy.success'.tr),
    );
  } catch (err) {
    debugPrint(err.toString());
  }
}
