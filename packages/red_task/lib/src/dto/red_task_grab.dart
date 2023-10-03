class RedTaskGrabDto {
  int? itemId;
  int? id;
  int? cid;
  int? grabWay;
  int? offset;
  int? stime;
  int? etime;

  RedTaskGrabDto({
    this.itemId,
    this.id,
    this.cid,
    this.grabWay,
    this.offset,
    this.etime,
    this.stime,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['id'] = id;
    data['cid'] = cid;
    data['grab_way'] = grabWay;
    data['offset'] = offset;
    data['stime'] = stime;
    data['etime'] = etime;
    return data;
  }
}
