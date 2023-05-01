import 'package:flutter/material.dart';
import 'package:shop_shoes/models/cart_model.dart';
import 'package:shop_shoes/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _cart = [];
  List<CartModel> get cart => _cart;

  set cart(List<CartModel> cart) {
    _cart = cart;
    notifyListeners();
  }

  // BEBERPA FUNCTION
  addCart(ProductModel productModel) {
    if (productExist(productModel)) {
      int index = _cart
          .indexWhere((element) => element.productModel!.id == productModel.id);
      // jadi jika nanti menambahkan product yang sama maka hanya akan menambahkan quantity nya
      _cart[index].quantity++;
    } else {
      _cart.add(
        CartModel(
          // tambahkan id sesuai panjang cart nya
          id: _cart.length,
          productModel: productModel,
          // lalu mulai nilai quantity dari angka 1
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  // Remove cart
  removeCart(int? id) {
    _cart.removeAt(id!);
    notifyListeners();
  }

  // fungsi add qantity
  addQuantity(int? id) {
    _cart[id!].quantity++;
    notifyListeners();
  }

  // Mengurangi quantity
  reduceQuantity(int? id) {
    _cart[id!].quantity--;
    // Jika sudah sisa 1 agar tidak minus
    if (_cart[id].quantity == 0) {
      _cart.removeAt(id);
    }
    notifyListeners();
  }

  // function menghitung jumlah barang checkout
  totalitems() {
    int total = 0;
    for (var item in _cart) {
      total += item.quantity;
    }
    return total;
  }

  totalPrice() {
    double total = 0;
    for (var item in _cart) {
      total += (item.quantity * item.productModel!.price);
    }
    return total;
  }

  // untuk cek apakah product sudah masuk kecart belum
  productExist(ProductModel productModel) {
    if (_cart.indexWhere((element) => element.id == productModel.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
