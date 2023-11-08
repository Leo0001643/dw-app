import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/imagex.dart';

class SelectAvatarState {
  SelectAvatarState() {
    ///Initialize variables
  }

  var selectIndex = (-1).obs;

  var tabIndex = 0.obs;


  var defaultList = [ImageX.w1,ImageX.m1,ImageX.w2,ImageX.m2,ImageX.w3,ImageX.m3,ImageX.w4,ImageX.m4,ImageX.w5,ImageX.m5,ImageX.w6,ImageX.m6,
    ImageX.w7,ImageX.m7,ImageX.w8,ImageX.m8,ImageX.w9,ImageX.m9,ImageX.w10,ImageX.m10];


  var qqList = [ImageX.q1,ImageX.q2,ImageX.q3,ImageX.q4,ImageX.q5,ImageX.q6,ImageX.q7,ImageX.q8,
    ImageX.q9,ImageX.q10,ImageX.q11,ImageX.q12,ImageX.q13,ImageX.q14,ImageX.q15,ImageX.q16,ImageX.q17,
    ImageX.q18,ImageX.q19,ImageX.q20,ImageX.q21,ImageX.q22,ImageX.q23,ImageX.q24,ImageX.q25,ImageX.q26,ImageX.q27,
    ImageX.q28,ImageX.q29,ImageX.q30,ImageX.q31,ImageX.q32,ImageX.q33,ImageX.q34,ImageX.q35,ImageX.q36,ImageX.q37,ImageX.q38,ImageX.q39,ImageX.q40,ImageX.q41,
    ImageX.q42,ImageX.q43,ImageX.q44,ImageX.q45,ImageX.q46,ImageX.q47,ImageX.q48,ImageX.q49,ImageX.q50,ImageX.q51,
    ImageX.q52,ImageX.q53,ImageX.q54,ImageX.q55, ImageX.q56,ImageX.q57,ImageX.q58,ImageX.q59,ImageX.q60,ImageX.q61,
    ImageX.q62,ImageX.q63,ImageX.q64,ImageX.q65, ImageX.q66,ImageX.q67,ImageX.q68,ImageX.q69, ImageX.q70,];


  var selectionList = [ImageX.f1,ImageX.f2,ImageX.f3,ImageX.f4,ImageX.f5,ImageX.f6,ImageX.f7,ImageX.f8,ImageX.f9,ImageX.f10,ImageX.f11,ImageX.f12,ImageX.f13,ImageX.f14,ImageX.f15,
  ImageX.f16,ImageX.f17,ImageX.f18,ImageX.f19,ImageX.f20,ImageX.f21,ImageX.f22,ImageX.f23,ImageX.f24,];

  var tabs = [Intr().moren,Intr().qq,Intr().jingxuan];


}
