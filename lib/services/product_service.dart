import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shop_shoes/models/product_model.dart';

class ProductService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  // Function Get Product
  Future<List<ProductModel>> getproducts() async {
    var url = '$baseUrl/products';

    var header = {
      'Content-Type': 'application/json',
    };

    var response = await http.get(Uri.parse(url), headers: header);

    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      List data = json.decode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Get Products');
    }
  }
}
