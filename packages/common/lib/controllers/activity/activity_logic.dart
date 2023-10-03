import 'dart:convert';

import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ActivityLogicState {
  final RxList<ActivityType> activityTypes = RxList<ActivityType>([
    ActivityType(
      id: null,
      classNameCn: '全部'.tr,
    ),
  ]);

  // 活动列表
  PagingController<int, ActivityInfo> pagingController = PagingController(
    firstPageKey: 1,
  );

  final UserInListDto payload = UserInListDto(
    currentPageTotal: 8,
    currentPage: 1,
    isOptimize: 1,
    typesid: null,
  );

  final Rx<int?> _currentTypeId = Rx<int?>(null);

  int? get currentTypeId => _currentTypeId.value;

  set currentTypeId(int? value) => _currentTypeId.value = value;

  final RxInt _tabIndex = 0.obs;

  int get tabIndex => _tabIndex.value;

  set tabIndex(int value) => _tabIndex.value = value;

  RxList<ActivityInfo> activityInfoList = RxList([]);

  GlobalKey<FormBuilderState> applyFormKey = GlobalKey<FormBuilderState>();

  final RxBool _formIndex = true.obs; //默认首页进入，flase是从优惠中心

  bool get formIndex => _formIndex.value;

  set formIndex(bool value) => _formIndex.value = value;

  final RxInt _yesOrNo = 1.obs;

  int get yesOrNo => _yesOrNo.value;

  set yesOrNo(int value) => _yesOrNo.value = value;

  final RxString _startDate = ''.obs;

  String get startDate => _startDate.value;

  set startDate(String val) => {_startDate.value = val};

  final RxString _startDatetmp = ''.obs;

  String get startDatetmp => _startDatetmp.value;

  set startDatetmp(String val) => {_startDatetmp.value = val};
}

class ActivityLogic extends BaseController {
  static ActivityLogic get to => Get.find();

  ActivityProvider provider = ActivityProvider();

  ActivityLogicState state = ActivityLogicState();

  @override
  void onInit() {
    super.onInit();
    state.pagingController.addPageRequestListener(
      (pageKey) => getActivityList(pageKey),
    );
    _getTypeList();
  }

  Future<ActivityTypesEntity?> _getTypeList() async {
    return await fetchHandler<ActivityTypesEntity>(
      provider.getTypeList(),
      onSuccess: (res) => state.activityTypes.addAll(res.items!),
    );
  }

  void onTypeChange(int? type) {
    state.payload.typesid = type;
    state.currentTypeId = type;
    state.pagingController.refresh();
  }

  Future<ActivitiesEntity?> getActivityList(int pageKey) async {
    print('获取活动列表aaaaad123123');
    state.payload.currentPage = pageKey;
    return await fetchHandler<ActivitiesEntity>(
        provider.getActivities(state.payload),
        onSuccess: (res) {
          bool isLastPage = res.items!.length < state.payload.currentPageTotal!;
          if (isLastPage) {
            state.activityInfoList.addAll(res.items!);
            state.pagingController.appendLastPage(res.items!);
          } else {
            var nextPage = pageKey + 1;
            state.activityInfoList.addAll(res.items!);
            state.pagingController.appendPage(res.items!, nextPage);
          }
        },
        onError: (error) => state.pagingController.appendPage([], 1));
  }

  // 获取活动详情
  Future<ActivityInfo?> getActivityDetail(int id, {bool? loading}) async {
    ActivityDetailDto dto =
        ActivityDetailDto(id: id, is_optimize: 1, typesid: state.currentTypeId);
    int index = 0;
    if (state.pagingController.itemList != null) {
      // 获取要获取内容的活动index
      index = state.pagingController.itemList!.indexWhere(
        (element) => element.id == dto.id,
      );
      // 如果活动内容已存在 则直接返回
      ActivityInfo item = state.pagingController.itemList![index];
      if (item.qtAppContent != null && item.qtAppContent != "") {
        return item;
      }
    }
    // 否则向服务端请求数据
    return await fetchHandler<ActivityItem>(
      provider.getActivityDetail(dto),
      loading: loading ?? true,
      onSuccess: (res) {
        if (state.pagingController.itemList != null) {
          state.pagingController.itemList![index].qtAppContent =
              res.item!.qtAppContent;
        }
      },
    ).then((value) => value?.item);
  }

  ActivityApplyEntity generateApplyForm(ActivityInfo item) {
    List<dynamic> _list = jsonDecode(item.dataJson!);
    return ActivityApplyEntity.fromJson(_list[0]);
  }

  Future<void> applyActivity(int id, VoidCallback callback) async {
    bool isValid = state.applyFormKey.currentState!.saveAndValidate();
    if (isValid) {
      Map form = state.applyFormKey.currentState!.value;
      List<ExtArgs> args = form.entries
          .map((e) => ExtArgs(extName: e.key, extVal: e.value))
          .toList();
      UserJoinVDto dto =
          UserJoinVDto(activityid: id, extArgs: jsonEncode(args));
      await fetchHandler<CommonTipsEntity>(provider.userJoin(dto),
          onSuccess: (res) {
        SmartDialog.showToast(res.message ?? '申请成功');
      });
    }
  }

  Future<void> applyActivityNew(int id, VoidCallback callback) async {
    bool isValid = state.applyFormKey.currentState!.saveAndValidate();
    if (isValid) {
      Map form = state.applyFormKey.currentState!.value;
      List<ExtArgs> args = form.entries
          .map((e) => ExtArgs(extName: e.key, extVal: e.value))
          .toList();
      if (args.length >= 3) {
        args[2].extVal = state.startDate;
      }
      args.add(ExtArgs(extName: '4', extVal: state.yesOrNo.toString()));
      UserJoinVDto dto =
          UserJoinVDto(activityid: id, extArgs: jsonEncode(args));
      await fetchHandler<CommonTipsEntity>(provider.userJoin(dto),
          onSuccess: (res) {
        SmartDialog.showToast(res.message ?? '申请成功');
        Get.back();
      });
    }
  }
}
