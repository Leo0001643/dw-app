// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
//
// class YourFlutterClass extends StatefulWidget {
//   @override
//   _YourFlutterClassState createState() => _YourFlutterClassState();
// }
//
// class _YourFlutterClassState extends State<YourFlutterClass> {
//   Map<String, dynamic> roomCountdown = {};
//   int diffTime = 0;
//   Map<String, dynamic> allTime = {};
//   Timer? timer1;
//
//   @override
//   void initState() {
//     super.initState();
//     getPC28Plan();
//   }
//
//   void getPC28Plan() {
//     urlGetPC28Plan({'termCount': 5}).then((res) {
//       if (res['code'] == 100000) {
//         diffTime = DateTime.parse(res['data']['timestamp']).millisecondsSinceEpoch -
//             DateTime.now().millisecondsSinceEpoch;
//         setAllTime(res['data']['all']);
//         timer1?.cancel();
//         timeCountOnly();
//         timer1 = Timer.periodic(Duration(seconds: 1), (timer) {
//           timeCountOnly();
//         });
//       } else {
//       }
//     });
//   }
//
//   void setAllTime(Map<String, dynamic> all) {
//     setState(() {
//       allTime = all;
//     });
//   }
//
//   void timeCountOnly() {
//     Map<String, dynamic> roomInf = {}; // Replace with your implementation for getting roomInf
//     for (var key in allTime.keys) {
//       if (roomInf[key]['stateMsg'] != 0) {
//         if (roomInf[key]['stateMsg'] == 1) {
//           roomCountdown[key + 'Time'] = '维护中';
//         } else if (roomInf[key]['stateMsg'] == 3) {
//           roomCountdown[key + 'Time'] = '已关盘';
//         } else if (roomInf[key]['stateMsg'] == 4) {
//           roomCountdown[key + 'Time'] = '已休市';
//         }
//         roomCountdown[key + 'Term'] = '--';
//         roomCountdown[key + 'Notice'] = allTime[key]['msg'] ?? '';
//         continue;
//       }
//
//       if (allTime[key]['code'] == 100020) {
//         roomCountdown[key + 'Time'] = '等待开盘';
//         roomCountdown[key + 'Term'] = '--';
//         roomCountdown[key + 'Notice'] = allTime[key]['msg'];
//       } else {
//         if (allTime[key]['data'].length > 1) {
//           for (var s = 0; s < allTime[key]['data'].length - 1; s++) {
//             var onlineT = DateTime.now().millisecondsSinceEpoch + diffTime;
//             if (onlineT <= allTime[key]['data'][s + 1]['openTime']) {
//               var openT =
//                   (allTime[key]['data'][s + 1]['openTime'] - onlineT) ~/ 1000;
//               roomCountdown[key + 'OpenResult'] = openT;
//               if (openT == 0) {
//                 roomCountdown[key + 'OpenResult'] = '开奖中';
//               }
//
//               if (onlineT > allTime[key]['data'][s]['closeTime'] &&
//                   onlineT < allTime[key]['data'][s + 1]['openTime']) {
//                 var rrtime = allTime[key]['data'][s]['closeTime'];
//                 var showT = (rrtime - onlineT) ~/ 1000;
//                 var showtime = secToTime(showT);
//                 roomCountdown[key + 'Time'] = showtime;
//                 roomCountdown[key + 'Term'] = allTime[key]['data'][s]['term'];
//                 break;
//               } else if (onlineT > allTime[key]['data'][s]['closeTime'] &&
//                   onlineT < allTime[key]['data'][s + 1]['openTime']) {
//                 roomCountdown[key + 'Time'] = '封盘中';
//                 roomCountdown[key + 'Term'] = allTime[key]['data'][s]['term'];
//                 break;
//               }
//             }
//           }
//         } else if (allTime[key]['data'].length == 1) {
//           var onlineT = DateTime.now().millisecondsSinceEpoch + diffTime;
//           if (onlineT > allTime[key]['data'][0]['closeTime'] &&
//               onlineT < allTime[key]['data'][0]['openTime']) {
//             var rrtime = allTime[key]['data'][0]['closeTime'];
//             var showT = (rrtime - onlineT) ~/ 1000;
//             var showtime = secToTime(showT);
//             roomCountdown[key + 'Time'] = showtime;
//             roomCountdown[key + 'Term'] = allTime[key]['data'][0]['term'];
//           } else if (onlineT < allTime[key]['data'][0]['openTime']) {
//             roomCountdown[key + 'Time'] = '封盘中';
//             roomCountdown[key + 'Term'] = allTime[key]['data'][0]['term'];
//           }
//         }
//       }
//     }
//
//     setRoomCountdown(roomCountdown);
//   }
//
//   void setRoomCountdown(Map<String, dynamic> countdown) {
//     setState(() {
//       roomCountdown = countdown;
//     });
//   }
//
//   // Add your own implementation for showToast and secToTime functions
//
//   @override
//   void dispose() {
//     timer1?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Build your Flutter UI here
//     return Container();
//   }
// }
//
// Future<Map<String, dynamic>> urlGetPC28Plan(Map<String, dynamic> params) async {
//   // Replace with your implementation for making HTTP request
//   return {};
// }
//
// // Add your own implementation for showToast and secToTime functions
