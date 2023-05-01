import 'package:shop_shoes/models/product_model.dart';

class CartModel {
  int? id;
  ProductModel? productModel;
  int quantity = 1;

  CartModel({this.id, this.productModel, this.quantity = 1});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productModel = ProductModel.fromJson(json['product_model']);
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_model': productModel!.toJson(),
      'quantity': quantity,
    };
  }

  // membuat total harga dari barang
  getTotalPrice() {
    return productModel!.price * quantity;
  }
}
