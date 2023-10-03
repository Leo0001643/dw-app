// import 'package:aone_common/common.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
// import 'package:get/get.dart';
//
// class RechargeVipDialog extends StatelessWidget {
//   final VipPayProduct product;
//
//   const RechargeVipDialog({
//     Key? key,
//     required this.product,
//   }) : super(key: key);
//
//   void onToWebPage() {
//     if (GetUtils.isURL(product.href!)) {
//       Get.toNamed(
//         Routes.webPage,
//         arguments: WebData(product.href!),
//       );
//     } else {
//       SmartDialog.showToast('');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BaseDialog(
//       title: product.itemName,
//       child: Padding(
//         padding: EdgeInsets.all(12.r),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Center(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 10.r),
//                 child: ExtendedImage.network(
//                   product.img ?? '',
//                   fit: BoxFit.fill,
//                   width: 150.r,
//                   height: 150.r,
//                 ),
//               ),
//             ),
//             Text(
//               product.classname!,
//               maxLines: 1,
//               textAlign: TextAlign.center,
//               overflow: TextOverflow.ellipsis,
//               style: AppTheme.header2.copyWith(
//                 fontSize: 14.sp,
//               ),
//             ),
//             if (product.href != null)
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.r),
//                         border: Border.all(
//                           color: AppTheme.primary,
//                         ),
//                       ),
//                       margin: EdgeInsets.symmetric(vertical: 5.r),
//                       padding: EdgeInsets.symmetric(
//                         vertical: 5.r,
//                         horizontal: 11.r,
//                       ),
//                       child: Text(
//                         product.href!,
//                         style: AppTheme.p3.copyWith(
//                           color: AppTheme.primary,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 5.r,
//                   ),
//                   ThemeButton(
//                     onTap: () => copyToClipboard(product.href),
//                     text: '复制',
//                     height: 26.r,
//                     radius: 26,
//                   ),
//                 ],
//               ),
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 10.r),
//               padding: EdgeInsets.symmetric(
//                 vertical: 8.r,
//                 horizontal: 10.r,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5.r),
//                 boxShadow: [
//                   BoxShadow(
//                     color: AppTheme.shadowColor,
//                     blurStyle: BlurStyle.inner,
//                     blurRadius: 30.r,
//                   ),
//                 ],
//               ),
//               child: Text(
//                 product.remarks!,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   color: AppTheme.neutral2,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ThemeButton.neutral(
//                     onTap: Get.back,
//                     text: '取消',
//                     width: 110.r,
//                   ),
//                   ThemeButton(
//                     onTap: onToWebPage,
//                     text: '确认',
//                     width: 110.r,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
