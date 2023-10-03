import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/notice/Items.dart';
import 'package:get/get.dart';

class PopupService extends BaseService {
  static PopupService get to => Get.find();

  final MessageCenterProvider _messageCenterProvider = MessageCenterProvider();

  late final RxList<NoticeItems> noticeList = RxList.empty();

  final RxInt listLength = 0.obs;

  // 刷新
  Future<void> Function() get refresh => _getNoticeList;

  /// style1 由于需要重复弹出 所以必须传入[Future]
  final Future Function(NoticeItems) style1;
  final Function(List<NoticeItems>) style2;
  final Function(List<NoticeItems>) style3;
  final Function(List<NoticeItems>)? style4;
  final Future Function(NoticeItems)? style5;

  final Map<String, String> _showPageMap = {
    Routes.home: 'ordinary',
    Routes.agentReg: 'registered_agent',
    Routes.userReg: 'registered_members',
    Routes.recharge: 'top_up',
    Routes.withdraw: 'drawing',
    Routes.main: 'ordinary',
  };

  /// 三种样式[NoticeItems.popupWindowDisplayPage['mobile']]
  PopupService({
    required this.style1,
    required this.style2,
    required this.style3,
    this.style4,
    this.style5,
  });

  Future<PopupService> init() async {
    await _getNoticeList();
    return this;
  }

  /// 默认会自动获取currentRoute，但有个别情况无法获取到[Get.currentRoute]可以自行传入对应的RouteName
  /// 请在页面的[onReady]里面调用
  Future<void> triggerPopup({String? routeName, bool? isSupportStyle5 //特殊情况
      }) async {
    routeName ??= Get.currentRoute;
    print('noticeList.length == ${noticeList.length}');

    List<NoticeItems> list = noticeList.where((el) {
      String? key = _showPageMap[routeName];
      if (key != null) {
        return el.popupWindowDisplayPage == key;
      }
      return false;
    }).toList();

    print('list.length == ${list.length}');
    if (list.isNotEmpty) {
      AnnouncementBean bean =
          AnnouncementBean.fromJson(list.first.announcementTheStyle);
      int styleNum = bean.mobile ?? 0;

      // 只有首页的弹窗样式会根据参数切换样式，其余的页面统一采用样式1
      if (routeName != Routes.home) {
        styleNum = 1;
      }
      //todo app01打包先注释报错代码
      // if (routeName == Routes.main) {
      //   styleNum = 4;
      // }

      switch (styleNum) {
        case 2:
          style2(list);
          break;
        case 3:
          style3(list);
          break;
        //todo app01打包先注释报错代码
        case 4:
          style4!(list);
          break;
        default:
          if (routeName == Routes.home && isSupportStyle5 == true) {
            //强制使用这个弹窗
            for (var item in list) {
              await style5!(item);
            }
          } else {
            for (var item in list) {
              await style1(item);
            }
          }
          break;
      }
    }
  }

  Future<void> _getNoticeList() async {
    noticeList.clear();
    await fetchHandler<NoticeEntity>(_messageCenterProvider.getPopNotice(),
        onSuccess: (res) {
      print('items.length == ${res.items!.length}');
      print('total.length == ${res.total!}');

      noticeList.addAll(res.items ?? []);
      listLength.value = res.items?.length ?? 0;
    });
  }

  //获取当前弹窗的类型 shit code
  Future<int> getPopupType({String? routeName, String? appSiteTag}) async {
    routeName ??= Get.currentRoute;

    List<NoticeItems> list = noticeList.where((el) {
      String? key = _showPageMap[routeName];
      if (key != null) {
        return el.popupWindowDisplayPage == key;
      }
      return false;
    }).toList();

    if (list.isNotEmpty) {
      AnnouncementBean bean =
          AnnouncementBean.fromJson(list.first.announcementTheStyle);
      int styleNum = bean.mobile ?? 0;

      // 只有首页的弹窗样式会根据参数切换样式，其余的页面统一采用样式1
      if (routeName != Routes.home) {
        styleNum = 1;
      }
      return styleNum;
    } else {
      return 1;
    }
  }
}
