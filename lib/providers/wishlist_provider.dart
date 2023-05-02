import 'package:flutter/material.dart';
import '../../models/product_model.dart';

class WishListProvider with ChangeNotifier {
  List<ProductModel> _wishList = [];

  List<ProductModel> get wishList => _wishList;

  set wishList(List<ProductModel> wishList) {
    _wishList = wishList;
    notifyListeners();
  }

  // Jika product tidak ada maka tambahkan, jika ada di wishlist maka di remove sesuai id product
  setProduct(ProductModel productModel) {
    if (!isWishlist(productModel)) {
      _wishList.add(productModel);
    } else {
      _wishList.removeWhere((element) => element.id == productModel.id);
    }

    notifyListeners();
  }

  // Untuk cek apakah product ada di wishlist, misal ada dikurangi atau meambah
  // Kalau belum ada akan mereturn false, kalau sudah ada akan mereturn true
  isWishlist(ProductModel productModel) {
    if (_wishList.indexWhere((element) => element.id == productModel.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
