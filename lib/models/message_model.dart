import '../../models/product_model.dart';

class MessageModel {
  String? message;
  int? userId;
  String? userName;
  String? userImage;
  bool? isFromUser;
  ProductModel? productModel;
  DateTime? createdAt;
  DateTime? updatedAt;
  // kalau ingin ditambahkan id nya kalau jika ingin update atau hapus chat nya

  MessageModel({
    this.message,
    this.userId,
    this.userName,
    this.userImage,
    this.isFromUser,
    this.productModel,
    this.createdAt,
    this.updatedAt,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['userId'];
    userName = json['userName'];
    userImage = json['userImage'];
    isFromUser = json['isFromUser'];
    productModel = json['productModel'].isEmpty
        ? UninitilizedProductModel()
        : ProductModel.fromJson(json['productModel']);
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'isFromUser': isFromUser,
      'productModel': productModel is UninitilizedProductModel
          ? {}
          : productModel!.toJson(),
      'createdAt': createdAt!.toIso8601String(),
      'updatedAt': updatedAt!.toIso8601String()
    };
  }
}
