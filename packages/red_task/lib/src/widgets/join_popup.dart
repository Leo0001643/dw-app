import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:red_task/src/controllers/controllers.dart';
import 'package:red_task/src/utils/utils.dart';
import 'package:red_task/src/widgets/animation.dart';

import '../../red_task.dart';

class RedJoinPopup extends StatelessWidget {
  const RedJoinPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(JoinPopupController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: OrientationBuilder(builder: (context, orientation) {
        double top = orientation == Orientation.landscape ? 50 : 200;
        double right = orientation == Orientation.landscape ? 50 : 30;

        return Stack(
          children: [
            Center(
              child: PageView.builder(
                controller: ctrl.pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (_, index) => [
                  const _Applying(),
                  const _ApplySuccess(),
                  const _Unqualified(),
                  const _Limited(),
                ][index],
              ),
            ),
            Positioned(
              top: top.w,
              right: right.w,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.cancel_outlined,
                  size: 28.sp,
                ),
                color: Colors.white,
              ),
            )
          ],
        );
      }),
    );
  }
}

class _Limited extends StatelessWidget {
  const _Limited({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = RedTaskService.to;
    return Stack(
      alignment: Alignment.center,
      children: 
      
      RedTaskService.to.showType == 2 ? 
      [
         Transform.translate(
          offset: Offset(0, -122.5.r),
          child: ScaleAnimation(
          duration: 2,
          begin: 0.9,
          child: RedImage.redActStandardTow(
            'stp4-2.png',
            width: 350.r,
          ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, -122.5.r),
          child: ScaleAnimation(
          duration: 2,
          begin: 0.9,
          child: RedImage.redActStandardTow(
            'stp4-3.png',
            width: 350.r,
          ),
          ),
        ),
        
        Transform.translate(
          offset: Offset(0, 14.r),
          child: RedImage.redActStandardTow(
            'stp4-1${isCN() ? '' : 'e'}.png',
            width: 277.r,
          ),
        ),
        Transform.translate(
          offset: Offset(0, 110.r),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              service.onOpenCS();
            },
            child: SizedBox(
              width: 160.r,
              height: 20.r,
            ),
          ),
        )
      ]
      :[
        ScaleAnimation(
          duration: 2,
          begin: 0.9,
          child: RedImage.redActStandard(
            'stp4-2.png',
            width: 350.r,
          ),
        ),
        Transform.translate(
          offset: Offset(0, 14.r),
          child: RedImage.redActStandard(
            'stp4-1${isCN() ? '' : 'e'}.png',
            width: 350.r,
          ),
        ),
        Transform.translate(
          offset: Offset(0, 110.r),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              service.onOpenCS();
            },
            child: SizedBox(
              width: 160.r,
              height: 20.r,
            ),
          ),
        )
      ],
    );
  }
}

class _Unqualified extends StatelessWidget {
  const _Unqualified({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: 
      RedTaskService.to.showType == 2 ? 
       [
        
        Transform.translate(
          offset: Offset(0, 18.r),
          child: RedImage.redActStandardTow(
            'stp3-1${isCN() ? '' : 'e'}.png',
            width: isCN() ? 306.r : 306.r,
          ),
        ),

        ScaleAnimation(
          duration: 2,
          begin: 0.9,
          child: RedImage.redActStandardTow(
            'stp3-2.png',
            width: 357.r,
          ),
        ),
    
        Transform.translate(
          offset: Offset(0, 0.r),
          child: SizedBox(
            width: 200.r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _conditionsTow(),
            ),
          ),
        )
      ]
      :
      [
        ScaleAnimation(
          duration: 2,
          begin: 0.9,
          child: RedImage.redActStandard(
            'stp3-4.png',
            width: 300.r,
          ),
        ),
        Transform.translate(
          offset: Offset(0, 18.r),
          child: RedImage.redActStandard(
            'stp3-1${isCN() ? '' : 'e'}.png',
            width: isCN() ? 280.r : 260.r,
          ),
        ),
        ScaleAnimation(
          begin: 0.95,
          duration: 2,
          child: RedImage.redActStandard(
            'stp3-2.png',
          ),
        ),
        Transform.translate(
          offset: Offset(20.r, -60.r),
          child: ScaleAnimation(
            duration: 2,
            child: RedImage.redActStandard(
              'stp3-3.png',
              width: 180.r,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, 76.r),
          child: SizedBox(
            width: 200.r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _conditions(),
            ),
          ),
        )
      ],
    );
  }
  
  List<Widget> _conditionsTow() {
    List<Widget> list = [];
    final ctrl = JoinPopupController.to;
    if (ctrl.joinStatus == 202 || ctrl.joinStatus == 204) {
      list.add(_conditionTextTow('red.deposit2'.tr, ctrl.depositRequire));
    }
    
    if (ctrl.joinStatus == 203 || ctrl.joinStatus == 204) {
      list.add(_conditionTextTow('red.rolling2'.tr, ctrl.validBetRequire));
    }

    if (list.length == 2)
    {
      
      list.insert(1,SizedBox(height: 10.r,));
    }
    return list;
  }

  Widget _conditionTextTow(String text, String content) => ShaderMask(
      
        shaderCallback: (bound) {
          return const LinearGradient(
          
            colors: [
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(255, 228, 120, 1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(
            Offset.zero & bound.size,
          );
        },
        child: Container(
          child: Row(
            children: [
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textHeightBehavior: const TextHeightBehavior(
                  leadingDistribution: TextLeadingDistribution.even,
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(width: 7.5.r,),
              // const Spacer(),
              Text(
                content,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textHeightBehavior: const TextHeightBehavior(
                  leadingDistribution: TextLeadingDistribution.even,
                ),
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );

  List<Widget> _conditions() {
    List<Widget> list = [];
    final ctrl = JoinPopupController.to;
    if (ctrl.joinStatus == 202 || ctrl.joinStatus == 204) {
      list.add(_conditionText('还需充值 ${ctrl.depositRequire}'));
    }

    if (ctrl.joinStatus == 203 || ctrl.joinStatus == 204) {
      list.add(_conditionText('还需打码 ${ctrl.validBetRequire}'));
    }
    return list;
  }

  Widget _conditionText(String text) => ShaderMask(
        shaderCallback: (bound) {
          return const LinearGradient(
            colors: [
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(255, 228, 120, 1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(
            Offset.zero & bound.size,
          );
        },
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textHeightBehavior: const TextHeightBehavior(
            leadingDistribution: TextLeadingDistribution.even,
          ),
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}

class _ApplySuccess extends StatelessWidget {
  const _ApplySuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children:
      RedTaskService.to.showType == 2 ? [
        RedImage.redActStandardTow(
          'stp2-1${isCN() ? '' : 'e'}.png',
          width: 240.r,
        ),
        // RedImage.redActStandardTow('stp2-4.png', width: 240.r),
        Transform.translate(
          offset: Offset(0, -122.5.r),
          child: ScaleAnimation(
            begin: 0.95,
            duration: 2,
            child: RedImage.redActStandardTow(
              'stp2-2.png',
              width: 240.r,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0.r, 80.r),
          child: ScaleAnimation(
            begin: 0.8,
            child: GestureDetector(
              onTap: () {
                Get.back(closeOverlays: true);
                RedTaskService.to.toRedTaskPage();
              },
              child: Container(
                color: Colors.transparent,
                width: 160.r,
                height: 40.r,
              ),
            ),
          ),
        )
      ] :
       [
        RedImage.redActStandard(
          'stp2-1.png',
          width: 240.r,
        ),
        RedImage.redActStandard('stp2-4.png', width: 240.r),
        Transform.translate(
          offset: Offset(0, -56.r),
          child: ScaleAnimation(
            begin: 0.95,
            duration: 2,
            child: RedImage.redActStandard(
              'stp2-2.png',
              width: 240.r,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, -50.r),
          child: SlideAnimation(
            child: RedImage.redActStandard(
              'stp2-3.png',
              width: 200.r,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(76.r, 110.r),
          child: ScaleAnimation(
            begin: 0.8,
            child: GestureDetector(
              onTap: () {
                Get.back(closeOverlays: true);
                RedTaskService.to.toRedTaskPage();
              },
              child: Container(
                color: Colors.transparent,
                width: 60.r,
                height: 60.r,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _Applying extends StatelessWidget {
  const _Applying({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final ctrl = JoinPopupController.to;
    return Stack(
      alignment: Alignment.center,
      children: 
      RedTaskService.to.showType == 2 ?  
      [
        Transform.translate(
          offset: Offset(0, -40.r),
          child: ScaleAnimation(
            duration: 3,
            child: RedImage.redActStandardTow(
              'stp1-1.png',
              width: 338.r,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, -65.r),
          child: ScaleAnimation(
            curve: Curves.fastOutSlowIn,
            child: RedImage.redActStandardTow(
              'stp1-4${isCN() ? '' : 'e'}.png',
              width: 316.r,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, 45.r),
          child: ScaleAnimation(
             duration: 3,
            child: GestureDetector(
              onTap: ctrl.joinActivity,
              child: RedImage.redActStandardTow(
                'stp1-2${isCN() ? '' : 'e'}.png',
                width: 186.r,
              ),
            ),
          ),
        ),
      ]
      :
      [
        Transform.translate(
          offset: Offset(0, 16.r),
          child: RedImage.redActStandard(
            'stp1-5.png',
            width: 240.r,
          ),
        ),
        Transform.translate(
          offset: Offset(0, -20.r),
          child: ScaleAnimation(
            begin: 1,
            end: 0.8,
            duration: 3,
            child: RedImage.redActStandard(
              'stp1-3.png',
              width: 280.r,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, -40.r),
          child: ScaleAnimation(
            duration: 3,
            child: RedImage.redActStandard(
              'stp1-1.png',
              width: 320.r,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, -30.r),
          child: ScaleAnimation(
            curve: Curves.fastOutSlowIn,
            child: RedImage.redActStandard(
              'stp1-4${isCN() ? '' : 'e'}.png',
              width: 360.r,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, 80.r),
          child: ScaleAnimation(
            child: GestureDetector(
              onTap: ctrl.joinActivity,
              child: RedImage.redActStandard(
                'stp1-2.png',
                width: 80.r,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
