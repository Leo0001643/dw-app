class PayxxpayDto {
  int? itemId;
  String? cunkuanren;
  String? money;
  String? order;
  int? ishd;
  String? tag;
  int? productId;
  int? type;

  PayxxpayDto(
      {this.itemId,
        this.cunkuanren,
        this.money,
        this.order,
        this.ishd,
        this.tag,
        this.productId,
        this.type});

  PayxxpayDto.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    cunkuanren = json['cunkuanren'];
    money = json['money'];
    order = json['order'];
    ishd = json['ishd'];
    tag = json['tag'];
    productId = json['product_id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['cunkuanren'] = this.cunkuanren;
    data['money'] = this.money;
    data['order'] = this.order;
    data['ishd'] = this.ishd;
    data['tag'] = this.tag;
    data['product_id'] = this.productId;
    data['type'] = this.type;
    return data;
  }
}
