import 'package:hk_clothes/models/bag/product_bag.dart';

class Order {
  String orderId;
  String dateCreate;
  String dateDone;
  bool delivered;
  List<ProductBag> products;

  Order(
      {this.orderId,
      this.dateCreate,
      this.dateDone,
      this.delivered,
      this.products});

  Order.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    dateCreate = json['date_create'];
    dateDone = json['date_done'];
    delivered = json['delivered'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(new ProductBag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['date_create'] = this.dateCreate;
    data['date_done'] = this.dateDone;
    data['delivered'] = this.delivered;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
