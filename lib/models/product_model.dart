import 'dart:convert';

import '../../models/categori_model.dart';
import '../../models/galerry_model.dart';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int? id;
  String? name;
  int? price;
  String? description;
  dynamic tags;
  DateTime? createdAt;
  DateTime? updatedAt;
  CategoryModel? category;
  List<GaleryModel>? galleries;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.galleries,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        tags: json["tags"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        category: CategoryModel.fromJson(json["category"]),
        galleries: List<GaleryModel>.from(
            json["galleries"].map((x) => GaleryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "tags": tags,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "category": category!.toJson(),
        "galleries": List<dynamic>.from(galleries!.map((x) => x.toJson())),
      };
}

// Membuat turunan dari product model untuk fitur live chat
class UninitilizedProductModel extends ProductModel {}
