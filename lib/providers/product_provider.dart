import 'package:flutter/foundation.dart';
import '../../models/product_model.dart';
import '../../services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getproducts();
      _products = products;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
