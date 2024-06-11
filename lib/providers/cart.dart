import 'package:flutter/material.dart';
import 'package:training2/models/cart_item.dart';

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get jumlah {
    return _items.length;
  }

  double get totalHarga {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.qty * cartItem.price;
    });
    return total;
  }

  void addCart(String productId, String title, double price, String imageUrl) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (value) {
        return CartItem(
          id: value.id,
          title: value.title,
          price: value.price,
          qty: value.qty + 1,
          imageUrl: value.imageUrl,
        );
      });
    } else {
      // menambah product id baru
      _items.putIfAbsent(productId, () {
        return CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          qty: 1,
          imageUrl: imageUrl,
        );
      });
    }
    notifyListeners();
  }
}
