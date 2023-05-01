import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/cart_model.dart';

class TransactionService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<bool> checkout(
      String token, List<CartModel> cartModel, double totalPrice) async {
    var url = Uri.parse('$baseUrl/checkout');
    var header = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var body = jsonEncode(
      {
        'address': 'Surakarta',
        'items': cartModel
            .map(
              (e) => {
                'id': e.productModel!.id,
                'quantity': e.quantity,
              },
            )
            .toList(),
        'status': 'PENDING',
        'total_price': totalPrice,
        'shipping_price': 0.3
      },
    );

    var response = await http.post(
      url,
      headers: header,
      body: body,
    );

    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan Checkout');
    }
  }
}
