import 'package:flutter/foundation.dart';
import 'package:shop_shoes/services/transaction_service.dart';

import '../models/cart_model.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
      String token, List<CartModel> cartModel, double totalPrice) async {
    try {
      if (await TransactionService().checkout(token, cartModel, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }
}
