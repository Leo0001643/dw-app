// import 'package:appt01/theme/color_schema.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../user/records/widgets/record_search_button.dart';
// import '../user/records/widgets/record_time_widget.dart';
// import 'bill_record_select_menu.dart';
//
// // class RecordTopMenu extends StatelessWidget {
// //   final String? filterValue;
// //   final bool? hasFilter;
// //   Color? filterTextColor;
// //
// //   final double? filterWidth;
// //   final VoidCallback? selectedTap;
// //
// //   final String startDate;
// //   final String endDate;
// //   final VoidCallback? startDateTap;
// //   final VoidCallback? endDateTap;
// //   final VoidCallback? researchTap;
// //   Color? bgColor;
// //   Color? menuBgColor;
// //   Color? borderColor;
// //   Color? topBottomBorderColor;
// //   Color? titleColor;
// //
// //   Color? searchBgColor;
// //   Color? searchTitleColor;
// //
// //   final bool isMainMenuOpen;
// //   final bool isSubMenuOpen;
// //
// //   RecordTopMenu({
// //     Key? key,
// //     this.filterValue,
// //     this.hasFilter,
// //     this.filterWidth,
// //     this.selectedTap,
// //     this.bgColor,
// //     this.borderColor,
// //     this.menuBgColor,
// //     this.searchBgColor,
// //     this.searchTitleColor,
// //     this.titleColor,
// //     this.filterTextColor,
// //     this.topBottomBorderColor,
// //     required this.startDate,
// //     required this.endDate,
// //     required this.startDateTap,
// //     required this.endDateTap,
// //     required this.researchTap,
// //     required this.isSubMenuOpen,
// //     required this.isMainMenuOpen,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     ///一个站点只有一种主题色，在这里统一写死
// //     bgColor = const Color(0xFFD7D7D7);
// //     filterTextColor = Colors.white;
// //     menuBgColor = Colors.transparent;
// //     borderColor = Colors.white;
// //     titleColor = Colors.white;
// //     searchBgColor = const Color(0xFFF0C59A);
// //     searchTitleColor = const Color(0xFF79420D);
// //     topBottomBorderColor = Colors.transparent;
// //
// //     return Container(
// //       height: 60.r,
// //       padding: EdgeInsets.symmetric(horizontal: 19.r),
// //       margin: const EdgeInsets.only(top: 1),
// //       decoration: BoxDecoration(
// //         color: bgColor ?? AppTheme.primaryBg,
// //         border: Border(
// //           top: BorderSide(
// //               width: 1,
// //               color:
// //                   topBottomBorderColor ?? (borderColor ?? AppTheme.primaryBg)),
// //           bottom: BorderSide(
// //               width: 1,
// //               color:
// //                   topBottomBorderColor ?? (borderColor ?? AppTheme.primaryBg)),
// //         ),
// //       ),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.start,
// //         children: [
// //           Padding(
// //             padding: EdgeInsets.only(right: 10.r),
// //             child: RecordArrowButton(
// //               title: '存款',
// //               isOpen: isMainMenuOpen,
// //               onTap: () {
// //                 // Get.dialog(const BillRecordSelectMenu());
// //               },
// //             ),
// //           ),
// //           RecordArrowButton(
// //             title: '今日',
// //             isOpen: isMainMenuOpen,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
// class RecordArrowButton extends StatelessWidget {
//   final String title;
//   final VoidCallback? onTap;
//   bool isOpen;
//   RecordArrowButton(
//       {Key? key, required this.title, required this.isOpen, this.onTap})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTap: () {
//         if (onTap != null) {
//           onTap!();
//         }
//       },
//       child: Container(
//         width: 80.r,
//         height: 30.r,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15.r),
//             gradient: const LinearGradient(colors: [
//               Color(0xFFCC131B),
//               Color(0xFF8F1803),
//             ])),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                   fontSize: 12.sp,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white),
//             ),
//             SizedBox(
//               width: 6.r,
//             ),
//             Image.asset(
//               'assets/images/user/arrow_down.png',
//               width: 8.r,
//               height: 4.r,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
