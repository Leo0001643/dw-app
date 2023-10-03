import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:red_task/src/controllers/grab_red_controller.dart';
import 'package:red_task/src/entities/entities.dart';
import 'package:red_task/src/utils/utils.dart';
import 'package:red_task/src/widgets/animation.dart';

import '../red_task_service.dart';

class GrabRedPopup extends StatelessWidget {
  final RedTaskItem item;
  final RedTaskCycle cycle;
  final void Function() onClose;

  const GrabRedPopup({
    Key? key,
    required this.item,
    required this.onClose,
    required this.cycle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(GrabRedController(item: item, cycle: cycle));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: OrientationBuilder(
        builder: (context, orientation) {
          double top = orientation == Orientation.landscape ? 50 : 115;
          return Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: PageView.builder(
                  controller: ctrl.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (_, index) => [
                    const _RedFinish(),
                    _GrabRed(),
                    const _RedReward(),
                  ][index],
                ),
              ),
              Positioned(
                top: top.r,
                right: 50.r,
                child: IconButton(
                  onPressed: () {
                    onClose();
                    Get.back();
                  },
                  icon: Icon(
                    Icons.cancel_outlined,
                    size: 24.sp,
                  ),
                  color: Colors.white,
                ),
              )
            ],
          );
        }
      ),
    );
  }
}

class _RedFinish extends StatelessWidget {
  const _RedFinish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ScaleAnimation(
          child: RedImage.redActStandard(
            'clt1-1${isCN() ? '' : 'e'}.png',
          ),
        ),
        if(RedTaskService.to.showType != 2)
        Transform.translate(
          offset: Offset(0, 16.r),
          child: RedImage.redActStandard(
            'clt1-2.png',
          ),
        ),
      ],
    );
  }
}

class _GrabRed extends StatelessWidget {
  _GrabRed({Key? key}) : super(key: key);
  static List<Widget> redPackList = [
    RedImage.redActStandard('redbao.png'),
    RedImage.redActStandard(
      'redbao.png',
    ),
    RedImage.redActStandard(
      'redbao.png',
    ),
    RedImage.redActStandard(
      'yellowbao.png',
    ),
  ];
  final _service = RedTaskService.to;

  @override
  Widget build(BuildContext context) {
    // if(_service.orientation)
    return Center(
      child: SizedBox(
        width: 360.r,
        height: 600.r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_service.orientation == Orientation.portrait)
               
              /*
              Container(
                  margin: EdgeInsets.only(bottom: 30.r),
                  child: ShaderMask(
                    shaderCallback: (bound) {
                      return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(255, 251, 213, 1),
                            Color.fromRGBO(255, 255, 255, 1),
                          ],
                          stops: [
                            0.5,
                            1.0
                          ]).createShader(
                        Offset.zero & bound.size,
                      );
                    },
                    child: Text(
                      '抢红包中',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                  /*
                 SvgPicture.asset(
                  'assets/images/redwar/standard/portrait/svg/red_robbing.svg',
                  package: 'red_task',
                  fit: BoxFit.fill,
                  width: 200,
                  height: 50,
                  color: const Color.fromRGBO(255, 251, 213, 1),
                ),
                */
                  ),
                  */
            getHeaderShow(),   
            if (RedTaskService.to.showType != 2)
            SizedBox(height: 25.r,),
            Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.horizontal,
                spacing: 20.r,
                runSpacing: 20.r,
                children: <Widget>[
                  ..._buildReds(),
                ]),
          ],
        ),
      ),
    );
  }
  
  //头部
  Widget getHeaderShow(){

      if (RedTaskService.to.showType == 2)
      {
        return RedImage.redActStandard(
        'show_red_title${isCN() ? '' : 'e'}.png'
      );
      }else
      {
       return  SvgPicture.asset(
              'assets/images/redwar/standard/portrait/svg/red_robbing.svg',
              package: 'red_task',
              fit: BoxFit.fill,
              width: 200,
              height: 50,
              color: const Color.fromRGBO(255, 251, 213, 1),
            );
      }
  }


  List<Widget> _buildReds() {
    List<Widget> list = [];
    List.generate(3, (index) => list.add(_redPackage('redbao.png')));
    list.add(_redPackage('redbao.png'));
    return list..shuffle();
  }

  Widget _redPackage(String name) {
    final ctrl = GrabRedController.to;
    return GestureDetector(
      onTap: ctrl.grabRed,
      child: RedImage.redActStandard(
        name,
      ),
    );
  }
}

class _RedReward extends StatelessWidget {
  const _RedReward({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = GrabRedController.to;
    return Stack(
      alignment: Alignment.center,
      children:RedTaskService.to.showType == 2 ?[
        
        ScaleAnimation(
          duration: 1,
          child: Transform.translate(
            offset: Offset(0, -165.r),
            child: RedImage.redActStandard(
              'rwd1-3.png',
              width: 352.5.r,
            ),
          ),
        ),
        
        ScaleAnimation(
          child: 
          Transform.translate(
            offset: Offset(0, -165.r),
            child: RedImage.redActStandard(
            'rwd1-1.png',
            width: 367.5.r,
          ),
          ),
        ),
        Transform.translate(
          offset: Offset(0.r, 0),
          child: RedImage.redActStandard(
            'rwd1-2${isCN() ? '' : 'e'}.png',
            width: 320.r,
          ),
        ),

        Transform.translate(
          offset: Offset(-8.r, 120.r),
          child: ShaderMask(
            shaderCallback: (bound) {
              return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(253, 255, 222, 1),
                    Color.fromRGBO(242, 232, 189, 1),
                    Color.fromRGBO(223, 200, 145, 1),
                  ],
                  stops: [
                    0.3,
                    0.6,
                    1.0
                  ]).createShader(
                Offset.zero & bound.size,
              );
            },
            child: Obx(
              () => RichText(
                text: TextSpan(
                  text: GlobalService.to.state.siteHeaders.currencySymbol,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                      text: ctrl.rewardAmount.toString(),
                      style: TextStyle(
                        fontSize: 24.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ] : [
        
        RedImage.redActStandard('rwd1-4.png', width: 320.r),
        SwingAnimation(
          duration: 1,
          child: Transform.translate(
            offset: Offset(0, -50.r),
            child: RedImage.redActStandard(
              'rwd1-3.png',
              width: 200.r,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(-6.r, 0),
          child: RedImage.redActStandard(
            'rwd1-2.png',
            width: 320.r,
          ),
        ),
        ScaleAnimation(
          child: RedImage.redActStandard(
            'rwd1-1.png',
            width: 380.r,
          ),
        ),
        Transform.translate(
          offset: Offset(-8.r, 100.r),
          child: ShaderMask(
            shaderCallback: (bound) {
              return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(253, 255, 222, 1),
                    Color.fromRGBO(242, 232, 189, 1),
                    Color.fromRGBO(223, 200, 145, 1),
                  ],
                  stops: [
                    0.3,
                    0.6,
                    1.0
                  ]).createShader(
                Offset.zero & bound.size,
              );
            },
            child: Obx(
              () => RichText(
                text: TextSpan(
                  text: GlobalService.to.state.siteHeaders.currencySymbol,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                      text: ctrl.rewardAmount.toString(),
                      style: TextStyle(
                        fontSize: 24.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
