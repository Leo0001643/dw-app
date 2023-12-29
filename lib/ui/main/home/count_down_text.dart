// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:your_package_name/utils.dart'; // 请替换为你的实际包名或路径
//
// class YourWidget extends StatefulWidget {
//   @override
//   _YourWidgetState createState() => _YourWidgetState();
// }
//
// class _YourWidgetState extends State<YourWidget> {
//   Map<String, dynamic> roomInf = {};
//   Timer? timer1;
//   Timer? timer2;
//   int diffTime = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     getPc28LottoList();
//   }
//
//   @override
//   void dispose() {
//     timer1?.cancel();
//     timer2?.cancel();
//     super.dispose();
//   }
//
//   // 获取房间桌子
//   Future<void> getPc28LottoList() async {
//     try {
//       final res = await urlGetPc28LottoList();
//       if (res.code == 100000) {
//         roomInf = {};
//         for (var i = 0; i < res.data['rooms'].length; i++) {
//           roomInf[res.data['rooms'][i]['gameType']] = res.data['rooms'][i];
//         }
//         yourStore.setRoomInf(roomInf);
//         getPC28Plan();
//         timer2 = Timer.periodic(Duration(minutes: 2), (timer) {
//           getPC28Plan();
//         });
//       } else {
//         showToast(
//           message: res.message[yourLang],
//           position: 'bottom',
//           duration: Duration(seconds: 3),
//         );
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   // PC28盘口信息(V)
//   Future<void> getPC28Plan() async {
//     try {
//       final res = await urlGetPC28Plan({'termCount': 5});
//       if (res.code == 100000) {
//         diffTime = int.parse(res.data['timestamp']) - DateTime.now().millisecondsSinceEpoch;
//         yourStore.setAllTime(res.data['all']);
//         timer1?.cancel();
//         timeCountOnly();
//         timer1 = Timer.periodic(Duration(seconds: 1), (timer) {
//           timeCountOnly();
//         });
//       } else {
//         showToast(
//           message: res.message[yourLang],
//           position: 'bottom',
//           duration: Duration(seconds: 3),
//         );
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   // 计算倒计时
//   void timeCountOnly() {
//     final allTime = yourStore.allTime;
//     final roomCountdown = {};
//     final roomInf = yourStore.roomInf;
//
//     for (var key in allTime.keys) {
//       if (roomInf[key]?['stateMsg'] != 0) {
//         // 处理状态不为0的情况
//         // ...
//         continue;
//       }
//
//       if (allTime[key]['code'] == 100020) {
//         // 有些项是没有code这个字段的
//         roomCountdown[key + 'Time'] = yourI18n.t('Index.等待开盘');
//         roomCountdown[key + 'Term'] = '--';
//         roomCountdown[key + 'Notice'] = allTime[key]['msg'] ?? '';
//       } else {
//         // 处理其他情况
//         // ...
//       }
//     }
//
//     yourStore.setRoomCountdown(roomCountdown);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Yoreur widget build logic
//     return Text(
//       formatCountdownTime(), // Replace with the actual function to format countdown time
//       style: TextStyle(fontSize: 10.sp, color: Colors.white),
//     );
//   }
//   String formatCountdownTime() {
//     // Assuming you have a variable named countdownTimeInSeconds
//     int countdownTimeInSeconds = 33;
//
//     // Convert seconds to HH:mm:ss format
//     Duration duration = Duration(seconds: countdownTimeInSeconds);
//     String formattedTime = '${duration.inHours}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
//
//     return formattedTime;
//   }
//
// }
