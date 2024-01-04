// //获取房间桌子包含每个房间的等级
// fgetPc28LottoList () {
//   url_getPc28LottoList().then(res => {
//   if (res.code == 100000) {
//   let roomInf = {}
//   // 遍历res.data.rooms 将rooms里面的数据整理成 所需要的对象格式:
//   // {
//   //   fastbtb28:{
//   //       "gameType": "fastbtb28",//彩种的type值
//   //       "stateMsg": "0",//彩种的状态
//   //       "tables": [
//   //           {
//   //               "gameType": "fastbtb28",
//   //               "createTime": 1637395500000,
//   //               "level": 1,
//   //               "memo2": "哈哈哈1",
//   //               "memo1": "一触千金",
//   //               "name": "普通房",
//   //               "siteId": null,
//   //               "updateTime": 1701508233000,
//   //               "id": 54,
//   //               "state": 50,
//   //               "roomId": 18
//   //           },
//   //           {
//   //               "gameType": "fastbtb28",
//   //               "createTime": 1637395500000,
//   //               "level": 2,
//   //               "memo2": "SENIOR2",
//   //               "memo1": "火爆开启2",
//   //               "name": "高级房",
//   //               "siteId": null,
//   //               "updateTime": 1701508236000,
//   //               "id": 57,
//   //               "state": 50,
//   //               "roomId": 18
//   //           },
//   //           {
//   //               "gameType": "fastbtb28",
//   //               "createTime": 1637395500000,
//   //               "level": 3,
//   //               "memo2": "VIP3",
//   //               "memo1": "见证奇迹3",
//   //               "name": "贵宾房",
//   //               "siteId": null,
//   //               "updateTime": 1701508240000,
//   //               "id": 60,
//   //               "state": 50,
//   //               "roomId": 18
//   //           }
//   //       ],
//   //       "createTime": 1637395500000,
//   //       "memo2": "bitcoin123",
//   //       "memo": "比特币1分28",
//   //       "siteId": 9000,
//   //       "updateTime": 1701507292000,
//   //       "id": 18,
//   //       "state": 50
//   //   }
//   // }
//   for (let i = 0; i < res.data.rooms.length; i++) {
//   roomInf[res.data.rooms[i].gameType] = res.data.rooms[i]
//   }
//   //将自己整理好的数据格式存放到全局变量中
//   this.$store.commit('setroomInf', roomInf)
//   // 获取每个pc8彩种的开封盘计划（开封盘状态、开封盘的期数 和对应的时间）
//   this.getPC28Plan()
//   // 递归调用、每120秒 （2分钟）获取一次最新的开封盘日期和时间
//   this.timer2 = MyInterVal(() => {
//   this.getPC28Plan();
//   }, 120000)
//   } else {
//   showToast({ message: res.message[this.lang], position: 'bottom', duration: 3000 });
//   }
//   })
// },
// //PC28盘口信息(V)
// getPC28Plan () {
//   url_getPC28Plan({ termCount: 5 }).then(res => {
//   if (res.code == 100000) {
//   // 服务器的误差时间
//   this.diffTime = parseInt(res.data.timestamp) - new Date().getTime(); //服务器本地时间差值
//   // 将获取的所有彩种的开封盘更新后的最新数据 存到全局变量中备用
//   this.$store.commit('setallTime', res.data.all)
//   // 清除每秒钟的倒计时，防止内存溢出，及时修正最新的倒计时
//   this.timer1 && this.timer1.clear(); //关闭
//   // 执行倒计时的相关逻辑
//   this.timeCountOnly();
//   // 递归调用，一秒钟后重新执行倒计时的逻辑
//   this.timer1 = MyInterVal(() => {
//   this.timeCountOnly();
//   }, 1000)
//   } else {
//   showToast({ message: res.message[this.lang], position: 'bottom', duration: 3000 });
//   }
//   })
// },
// //计算倒计时
// timeCountOnly() {
//   //拿到所有彩种的开封盘的最新后端数据  对应本文件83行代码
//   let allTime = this.allTime;
//   // 自定义所以要的变量对象存储空间
//   let roomcountdown = {}
//   //拿到所有彩种的对象数据对应本文件64行代码
//   let roominf = this.$store.getters.roomInf
//   // 循环遍历遍历彩种的开封盘的最新后端数据 通过key value的方式取到对应的gameType值
//   // 此时的key对应的就是fastbtb28、jndx28、keno28、tw28（第一层循环 彩种循环，此时以具体的彩种判断逻辑）
//   for (let key in allTime) {
// //  roominf[key]  => roominf[fastbtb28] =>{
// //                 "gameType": "fastbtb28",//彩种的type值
// //                 "stateMsg": "0",//彩种的状态
// //                 "tables": [
// //                     {
// //                         "gameType": "fastbtb28",
// //                         "createTime": 1637395500000,
// //                         "level": 1,
// //                         "memo2": "哈哈哈1",
// //                         "memo1": "一触千金",
// //                         "name": "普通房",
// //                         "siteId": null,
// //                         "updateTime": 1701508233000,
// //                         "id": 54,
// //                         "state": 50,
// //                         "roomId": 18
// //                     },
// //                     {
// //                         "gameType": "fastbtb28",
// //                         "createTime": 1637395500000,
// //                         "level": 2,
// //                         "memo2": "SENIOR2",
// //                         "memo1": "火爆开启2",
// //                         "name": "高级房",
// //                         "siteId": null,
// //                         "updateTime": 1701508236000,
// //                         "id": 57,
// //                         "state": 50,
// //                         "roomId": 18
// //                     },
// //                     {
// //                         "gameType": "fastbtb28",
// //                         "createTime": 1637395500000,
// //                         "level": 3,
// //                         "memo2": "VIP3",
// //                         "memo1": "见证奇迹3",
// //                         "name": "贵宾房",
// //                         "siteId": null,
// //                         "updateTime": 1701508240000,
// //                         "id": 60,
// //                         "state": 50,
// //                         "roomId": 18
// //                     }
// //                 ],
// //                 "createTime": 1637395500000,
// //                 "memo2": "bitcoin123",
// //                 "memo": "比特币1分28",
// //                 "siteId": 9000,
// //                 "updateTime": 1701507292000,
// //                 "id": 18,
// //                 "state": 50
//     //             }
//
//     // 对应的游戏的stateMsg值 来判断是否属于那种具体状态 等于0 就是正常运营中（计算开封盘时间，倒计时）
//     if (roominf[key]?.stateMsg != 0) {
//       if (roominf[key]?.stateMsg == 1) {
//         roomcountdown[key + 'Time'] = this.$i18n.t("Index.维护中");
//       } else if (roominf[key]?.stateMsg == 3) {
//         roomcountdown[key + 'Time'] = this.$i18n.t("Index.已关盘");
//       } else if (roominf[key]?.stateMsg == 4) {
//         roomcountdown[key + 'Time'] = this.$i18n.t("Index.已休市");
//       }
//       roomcountdown[key + 'Term'] = '--';
//       // 对应游戏状态的提示语
//       roomcountdown[key + 'Notice'] = allTime[key].msg || '';
//       // 此时该项的pc8游戏判断逻辑已经走完，跳过此次（第一层循环）逻辑进入下一个游戏彩种的判断
//       continue;
//     }
//     // 状态等于0的时候， 游戏是正常状态情况下，官方游戏还没开始的判断code 不等于100020 进入倒计时
//     if (allTime[key].code == 100020) { //有些项是没有code这个字段的
//       roomcountdown[key + 'Time'] = this.$i18n.t("Index.等待开盘");
//       roomcountdown[key + 'Term'] = '--';
//       roomcountdown[key + 'Notice'] = allTime[key].msg;
//     } else {
//       // 排除以上特殊情况后进入倒计时的逻辑 这里面的逻辑都是每一秒钟执行一次
//
//       // 先判断彩种里面的data  开封盘数据是否存大于一条  这段逻辑需要判断用到下一条数据的开盘用，所以必须2条或两条数据以上才能执行通过
//       if (allTime[key].data.length > 1) {
//         // 按照先后顺序遍历循环开封盘的时间
//         for (let s = 0; s < allTime[key].data.length - 1; s++) {//（第二层循环 具体某个彩种下的开封盘五期或小于五期的循环循环，此时以当前时间判断为主要逻辑）
//           // 当前时间 = 本地时间 +  服务器的误差时间（82行计算得到的）数据换算成时间戳方便判断
//           let onlineT = new Date().getTime() + Number(this.diffTime); //计算服务器时间
//           // 本次循坏 当前时间小于等于本次循环的下一条数据的开盘时间
//           if (onlineT <= allTime[key].data[s + 1].openTime) {
//             // 符合上面这个条件的情况下， 计算开奖时间此时距离下一期的开奖时间（眯牌页面需要用到的开奖倒计时数据）数据换算成时间戳方便判断
//             let openT = parseInt((parseInt(allTime[key].data[s + 1].openTime) - onlineT) / 1000);
//             roomcountdown[key + 'OpenResult'] = openT;
//             if (openT == '0') {
//               roomcountdown[key + 'OpenResult'] = this.$i18n.t('MiPai.开奖中');
//             }
//             // 在当前循环小于下一条数据的开盘时间的前提下进行判断，如果当前时间 小于当前循环的开封盘数据的封盘时间，并且大于当前循环的开封盘开盘时间，（比如当前时间是 5， 开盘时间是 2，封盘时间是8）两个条件都满足的前提下， 此时的时间处于倒计时逻辑中
//             if (onlineT < allTime[key].data[s].closeTime && onlineT > allTime[key].data[s].openTime) {
//               let rrtime = allTime[key].data[s].closeTime //当前期的关盘时间
//               let showT = parseInt((parseInt(rrtime) - onlineT) / 1000); //当前时间减去此次循环封盘时间 即此时此刻距离封盘倒计时还有多久（这里换算成时间戳的数字类型）
//               let showtime = sec_to_time(showT); //这个函数是把剩余时间换成 HH:MM:SS 格式（00:01:59）
//               roomcountdown[key + 'Time'] = showtime;//将格式化好的时间值 存到roomcountdown['fastbtb28Time']
//               roomcountdown[key + 'Term'] = allTime[key].data[s].term;//将此时对应的游戏期数存到roomcountdown['fastbtb28Term']
//               break;//结束此次循环（第二层循环）
//             } else if (onlineT > allTime[key].data[s].closeTime && onlineT < allTime[key].data[s + 1].openTime) {//当前时间大于此次循环的封盘时间同时当前时间小于下一条数据的开盘时间，此时就是该期倒计时结束封盘中，并且下一期开盘时间还没到，这时间段内属于封盘时间）
//               roomcountdown[key + 'Time'] = this.$i18n.t("Index.封盘中");//此时属于封盘中
//               roomcountdown[key + 'Term'] = allTime[key].data[s].term;//将此时对应的游戏期数存到roomcountdown['fastbtb28Term']
//               break;//结束此次循环（第二层循环）
//             } else {//此时当前时间 不在以上两种情况说明该次循环的开封盘时间不在判断倒计时是否封盘中的情况，不用执行任何逻辑，自动进入下一条数据的循环中判断了
//               // console.log(allTime[key])
//             }
//
//           }
//
//         }
//       } else if (allTime[key].data.length == 1) {//开封盘时间的数据恰好只有一条的时候（185行相排斥的情况，恰好只有一条数据了）
//         let onlineT = new Date().getTime() + Number(this.diffTime); //计算服务器时间
//         if (onlineT < allTime[key].data[0].closeTime && onlineT > allTime[key].data[0].openTime) {//当前时间小于这次循环的封盘时间，并且大于此次的开盘时间，此时的时间处于倒计时逻辑中
//           let rrtime = allTime[key].data[0].closeTime //当前期的关盘时间
//           let showT = parseInt((parseInt(rrtime) - onlineT) / 1000);//当前时间减去此次循环封盘时间 即此时此刻距离封盘倒计时还有多久（这里换算成时间戳的数字类型）
//           let showtime = sec_to_time(showT);//这个函数是把剩余时间换成 HH:MM:SS 格式（00:01:59）
//           roomcountdown[key + 'Time'] = showtime;//将格式化好的时间值 存到roomcountdown['fastbtb28Time']
//           roomcountdown[key + 'Term'] = allTime[key].data[0].term;//将此时对应的游戏期数存到roomcountdown['fastbtb28Term']
//         } else if (onlineT < allTime[key].data[0].openTime) {//当前时间小于这次循环的开盘时间，此时就是上一期还处于封盘中，
//           roomcountdown[key + 'Time'] = this.$i18n.t("Index.封盘中");
//           roomcountdown[key + 'Term'] = allTime[key].data[0].term;
//         } else {
//           // console.log(allTime[key])
//         }
//       }
//     }
//   }
//   // console.log(roomcountdown) 这里的roomcountdown 对象就包含 就是此刻计算好的倒计时fastbtb28Time 对应的期数fastbtb28Term，开奖剩余时间fastbtb28OpenResult ，非正常情况下的提示语fastbtb28Notice
//   this.$store.commit('setroomcountdown', roomcountdown)//将这个roomcountdown 存到全局变量中， 方便需要用到倒计时的页面用到 这里的roomcountdown 是一秒钟执行一次timeCountOnly（），属于递归调用，并且保重了每次调用之前都会重新清除一下上次调用的副作用，防止数据错乱（对应本文件86行逻辑）
// },