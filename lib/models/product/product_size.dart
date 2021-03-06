class ProductSize {
  String psid;
  String pid;
  String sid;

  ProductSize({this.psid, this.pid, this.sid});

  ProductSize.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    sid = json['sid'];
    psid = json['psid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['psid'] = this.psid;
    data['pid'] = this.pid;
    data['sid'] = this.sid;
    return data;
  }
}
