import 'package:aone_common/services/user/user_service.dart';
import 'package:aone_common/utils/colors.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../theme/theme_scaffold.dart';
import '../controllers/vip_center_controller.dart';

class VipCenterView extends GetView<VipCenterController> {
  const VipCenterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VipCenterController>(builder: (_) {
      return ThemeScaffold(
        title: 'VIP中心',
        elevation: 0,
        backgroundColor: AppTheme.normalBgColor,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                _userView(),
                const SizedBox(height: 15,),
                _vipPrivilege(),
                const SizedBox(height: 15,),
                _vipDiscounts(),
                const SizedBox(height: 15,),
                _vipRank(),
              ],
            ),
          ),
        ),
      );
    });
  }
  //vip用户信息
  Widget _userView() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/activity/vip_center/activity_vip_bg.png'),
              fit: BoxFit.fill)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 32.5,
              backgroundImage: NetworkImage(
                'https://static.cccrrc.com/static/site-qt/h09_wap/153/img/usertop.png',
              ),
            ),
            title: Row(
              children: [
                Text(
                  UserService.to.state.userName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "assets/images/activity/vip_center/activity_vip_sign.png",
                  width: 53,
                  height: 18,
                )
              ],
            ),
            subtitle: const Text(
              '0加入VIP',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Image.asset(
              "assets/images/activity/vip_center/activity_vip_tips.png",
              width: 90,
              height: 40,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 5, left: 12, right: 12, bottom: 15),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/activity/vip_center/activity_vip_rank_bg.png'),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Image.asset(
                          "assets/images/activity/vip_center/activity_vip_text.png",
                          width: 70,
                          height: 70,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 23),
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/activity/vip_center/activity_vip_rank_sign.png",
                              width: 58,
                              height: 80,
                            ),
                            Positioned(
                                top: 45,
                                left: 24,
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text('您已升级到最高级别VIP',style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),),
                  const SizedBox(height: 8,),
                  Stack(
                    children: [
                      Container(
                        height: 14,
                        width: 207,
                        color: Colors.transparent,
                      ),
                      Positioned(
                        top: 3,
                        bottom: 4,
                        left: 5,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          child: LinearProgressIndicator(
                            value: 0.6,
                            color: Colors.white,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xff06C285)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        child: Container(
                          alignment: Alignment.topCenter,
                          width: 26,
                          height: 14,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/activity/vip_center/activity_vip_rank_progress.png'
                                  )
                              )
                          ),
                          child: Text('V99',style: TextStyle(
                              color: Color.fromRGBO(253, 115, 42, 1),
                              fontSize: 8,
                              fontWeight: FontWeight.w400),),
                        ),),
                    ],
                  ),
                  const SizedBox(height:15),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  //vip特权
  Widget _vipPrivilege(){
    return Container(
      margin:  const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppTheme.cardBackColor,
        borderRadius: BorderRadius.circular(5),
      ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               children: [
                 Container(
                   width: 2,
                   height: 16,
                   decoration: BoxDecoration(
                     color: stringToColor('997A5C'),
                     borderRadius: BorderRadius.circular(5),
                   ),
                 ),
                 const   SizedBox(width: 5,),
                 const   Text('VIP特权',style: TextStyle(
                     color: Colors.black,
                     fontSize: 14,
                     fontWeight: FontWeight.w700),)
               ],
             ),
             const SizedBox(height: 10,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 _vipPrivilegeItem('升级礼金',"assets/images/activity/vip_center/vip_privilege_upgrade.png",true),
                 _vipPrivilegeItem('丰厚俸禄',"assets/images/activity/vip_center/vip_privilege_salary.png",false),
                 _vipPrivilegeItem('身份标识',"assets/images/activity/vip_center/vip_privilege_identity.png",false),
                 _vipPrivilegeItem('私人助理',"assets/images/activity/vip_center/vip_privilege_assistant.png",false),
                 _vipPrivilegeItem('存款优惠',"assets/images/activity/vip_center/vip_privilege_deposit.png",false),
               ],
             )
           ],
          ),
        ),
    );
  }

  Widget _vipPrivilegeItem(String name,String icon,bool isSelected){
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              "assets/images/activity/vip_center/vip_privilege_bg.png",
              width: 50,
              height: 50,
            ),
            Positioned(
              left: 12,
              right: 13,
              top: 12,
              bottom: 13,
              child: Image.asset(
                icon,
                width: 25,
                height: 25,
              ),
            )
          ],
        ),
        const SizedBox(height: 5,),
        Text(
          name,
          style: TextStyle(
              color: stringToColor('997A5C'),
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400),
        )
      ],
    );
  }

  //vip优惠
  Widget _vipDiscounts(){
    return Container(
      margin:  const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppTheme.cardBackColor,
        borderRadius: BorderRadius.circular(5),
      ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [ Row(
               children: [
                 Container(
                   width: 2,
                   height: 16,
                   decoration: BoxDecoration(
                     color: stringToColor('997A5C'),
                     borderRadius: BorderRadius.circular(5),
                   ),
                 ),
                 const   SizedBox(width: 5,),
                 const   Text('VIP优惠',style: TextStyle(
                     color: Colors.black,
                     fontSize: 14,
                     fontWeight: FontWeight.w700),)
               ],
             ),
           ],
          ),
        ),
    );
  }

  //vip等级
  Widget _vipRank(){
    return Container(
      margin:  const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppTheme.cardBackColor,
        borderRadius: BorderRadius.circular(5),
      ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [ Row(
               children: [
                 Container(
                   width: 2,
                   height: 16,
                   decoration: BoxDecoration(
                     color: stringToColor('997A5C'),
                     borderRadius: BorderRadius.circular(5),
                   ),
                 ),
                 const   SizedBox(width: 5,),
                 const   Text('VIP等级',style: TextStyle(
                     color: Colors.black,
                     fontSize: 14,
                     fontWeight: FontWeight.w700),)
               ],
             ),
           ],
          ),
        ),
    );
  }
}
