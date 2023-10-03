import 'package:aone_common/common.dart';

/// 充值类型：
/// 大类： 1 线上充值 2 转账汇款 3 vip 通道
/// 一级产品类： 支付宝 微信 paypal 等等
/// 产品： 微信h5 or 扫码 等等
/// 三级产品/通道： 区别账户

/// 大类
class PayCategoryEntity {
  List<OnlineCategory>? xsItems;
  List<TransferCategory>? xxItems;
  List<VipPayProduct>? vipItems;
  OnlineInfo? onlineInfo;

  PayCategoryEntity({
    this.xsItems,
    this.xxItems,
    this.vipItems,
    this.onlineInfo,
  });

  PayCategoryEntity.fromJson(Map<String, dynamic> json) {
    var data = json['items'];
    if (data is List) {
      return;
    }
    xsItems = [];
    if (data['xsItems']['items'] is! List) {
      data['xsItems']['items']['items']
          .forEach((e) => xsItems!.add(OnlineCategory.fromJson(e)));
      onlineInfo = OnlineInfo.fromJson(data['xsItems']['items']['info']);
    }

    xxItems = [];
    if (data['xxItems']['items'] is! List) {
      data['xxItems']['items']['items']
          .forEach((e) => xxItems!.add(TransferCategory.fromJson(e)));
    }

    vipItems = [];
    if (data['vipItems']['items'] is! List) {
      data['vipItems']['items']['items']
          .forEach((e) => vipItems!.add(VipPayProduct.fromJson(e)));
    }
  }
}

/// 跳转 url+query
/// [OnlineProductChannel.url]/?url=[EnvConfig.appDomain]&username=[OnlineInfo.username]&sign=[OnlineInfo.sign]&site=[OnlineInfo.site]&time=[OnlineInfo.time]&money=[充值金额]&itemid=[OnlineProductChannel.itemId]&ishd=[同isHd 是否参加活动]
class OnlineInfo {
  String? username;
  String? site;
  int? time;
  String? sign;

  OnlineInfo({this.username, this.site, this.time, this.sign});

  OnlineInfo.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    site = json['site'];
    time = json['time'];
    sign = json['sign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['site'] = site;
    data['time'] = time;
    data['sign'] = sign;
    return data;
  }
}

class VipPayProduct implements BasePayCategory {
  int? itemId;
  int? productsId;
  int? order;
  int? cporder;
  String? itemIcon;
  String? itemName;
  int? addTime;
  String? img;
  int? enable; //1为图片  3为链接   4为图文   2 为什么不清楚
  String? href;
  String? remarks;
  @override
  String? tag;
  @override
  String? classname;
  @override
  String? classimg;

  VipPayProduct({
    this.itemId,
    this.productsId,
    this.order,
    this.cporder,
    this.itemIcon,
    this.itemName,
    this.addTime,
    this.img,
    this.enable,
    this.href,
    this.remarks,
    this.tag,
    this.classname,
    this.classimg,
  });

  VipPayProduct.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    productsId = json['products_id'];
    order = json['order'];
    cporder = json['cporder'];
    itemIcon = json['item_icon'];
    itemName = json['item_name'];
    addTime = json['add_time'];
    img = json['img'];
    enable = json['enable'];
    href = json['href'];
    remarks = json['remarks'];
    tag = json['tag'];
    classname = json['classname'];
    classimg = json['classimg'];
  }
}

class OnlineCategory implements BasePayCategory {
  @override
  String? classname;
  @override
  String? classimg;
  @override
  String? tag;
  List<OnlineProduct>? item;

  OnlineCategory({this.classname, this.classimg, this.tag, this.item});

  OnlineCategory.fromJson(Map<String, dynamic> json) {
    classname = json['classname'];
    classimg = json['classimg'];
    tag = json['tag'];
    if (json['item'] != null) {
      item = <OnlineProduct>[];
      json['item'].forEach((v) {
        item!.add(OnlineProduct.fromJson(v));
      });
    }
  }
}

class OnlineProduct {
  String? productsName;
  String? productsImg;
  int? productsId;
  String? productsTag;
  List<OnlineProductChannel>? item;

  OnlineProduct(
      {this.productsName,
      this.productsImg,
      this.productsId,
      this.productsTag,
      this.item});

  OnlineProduct.fromJson(Map<String, dynamic> json) {
    productsName = json['products_name'];
    productsImg = json['products_img'];
    productsId = json['products_id'];
    productsTag = json['products_tag'];
    if (json['item'] != null) {
      item = <OnlineProductChannel>[];
      json['item'].forEach((v) {
        item!.add(OnlineProductChannel.fromJson(v));
      });
    }
  }
}

class OnlineProductChannel {
  int? qtProclassOrder;
  int? order;
  int? cporder;
  int? itemId;
  int? ismoreMoney;
  List<String>? showMoney;
  String? paymax;
  String? paymin;
  String? url;
  String? beizhu;
  String? name;
  String? tag;

  OnlineProductChannel(
      {this.qtProclassOrder,
      this.order,
      this.cporder,
      this.itemId,
      this.ismoreMoney,
      this.showMoney,
      this.paymax,
      this.paymin,
      this.url,
      this.beizhu,
      this.name,
      this.tag});

  //是否允许手动输入金额
  get isShowInputMoney {
    return ismoreMoney == 1;
  }

  isEqual(OnlineProductChannel from) {
    return from.qtProclassOrder == qtProclassOrder &&
        from.order == order &&
        from.cporder == cporder &&
        from.itemId == itemId &&
        from.ismoreMoney == ismoreMoney &&
        from.showMoney == showMoney &&
        from.paymax == paymax &&
        from.paymin == paymin &&
        from.url == url &&
        from.beizhu == beizhu &&
        from.name == name &&
        from.tag == tag;
  }

  OnlineProductChannel.fromJson(Map<String, dynamic> json) {
    qtProclassOrder = json['qt_proclass_order'];
    order = json['order'];
    cporder = json['cporder'];
    itemId = json['item_id'];
    ismoreMoney = json['ismore_money'];

    //过滤中文的分隔符，正常数据是英文的,
    showMoney = [];
    List<String?> showMoneyFrom = json['show_money'].cast<String>();
    for (String? element in showMoneyFrom) {
      if (element?.contains('，') == true) {
        List<String>? list = element?.split('，');
        if (list != null) {
          showMoney?.addAll(list);
        }
      } else {
        if (element != null) {
          showMoney?.add(element);
        }
      }
    }

    paymax = json['paymax'];
    paymin = json['paymin'];
    url = json['url'];
    beizhu = json['beizhu'];
    name = json['name'];
    tag = '';
  }
}

class TransferCategory implements BasePayCategory {
  @override
  String? classname;
  @override
  String? classimg;
  @override
  String? tag;
  int? id;
  String? cur;
  int? type;
  String? brevis;
  List<TransferProduct>? item;

  TransferCategory({
    this.classname,
    this.id,
    this.classimg,
    this.tag,
    this.cur,
    this.type,
    this.brevis,
    this.item,
  });

  TransferCategory.fromJson(Map<String, dynamic> json) {
    classname = json['classname'];
    id = json['id'];
    classimg = json['classimg'];
    tag = json['tag'];
    cur = json['cur'];
    type = json['type'];
    brevis = json['brevis'];
    if (json['item'] != null) {
      item = <TransferProduct>[];
      json['item'].forEach((v) {
        item!.add(TransferProduct.fromJson(v));
      });
    }
  }
}

class TransferProduct {
  int? itemId;
  String? itemName;
  String? huilv;
  String? qburl;
  String? ercHuilv;
  String? ercPcImage;
  String? ercAppImage;
  String? ercQburl;
  String? img;
  int? isimgIswenzi;
  String? card; // 卡号
  String? bankname; // 收款银行
  String? userTruename; // 收款人
  String? zhihang; // 开户支行
  String? qtBeizhu; // 备注
  String? paymin; // 最小
  String? paymax; // 最大金额
  List<String>? showMoney; // 快捷金额
  int? ismoreMoney;

  //是否允许手动输入金额
  get isShowInputMoney {
    return ismoreMoney == 1;
  }

  TransferProduct({
    this.itemId,
    this.itemName,
    this.huilv,
    this.qburl,
    this.ercHuilv,
    this.ercPcImage,
    this.ercAppImage,
    this.ercQburl,
    this.img,
    this.isimgIswenzi,
    this.card,
    this.bankname,
    this.userTruename,
    this.zhihang,
    this.qtBeizhu,
    this.paymin,
    this.paymax,
    this.showMoney,
    this.ismoreMoney,
  });

  TransferProduct.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    huilv = json['huilv'];
    qburl = json['qburl'];
    ercHuilv = json['erc_huilv'];
    ercPcImage = json['erc_pc_image'];
    ercAppImage = json['erc_app_image'];
    ercQburl = json['erc_qburl'];
    img = json['img'];
    isimgIswenzi = json['isimg_iswenzi'];
    card = json['card'];
    bankname = json['bankname'];
    userTruename = json['user_truename'];
    zhihang = json['zhihang'];
    qtBeizhu = json['qt_beizhu'];
    paymin = json['paymin'];
    paymax = json['paymax'];

    //过滤中文的分隔符，正常数据是英文的,
    showMoney = [];
    List<String?> showMoneyFrom = json['show_money'].cast<String>();
    for (String? element in showMoneyFrom) {
      if (element?.contains('，') == true) {
        List<String>? list = element?.split('，');
        if (list != null) {
          showMoney?.addAll(list);
        }
      } else {
        if (element != null) {
          showMoney?.add(element);
        }
      }
    }

    ismoreMoney = json['ismore_money'];
  }
}

abstract class BasePayCategory {
  String? classimg;
  String? classname;
  String? tag;

  @override
  String toString() {
    // TODO: implement toString
    return "classimg:${classimg}  classname:${classname}  tag:${tag}";
  }

  // itemsTagString(){
  //
  // }
  //

}
