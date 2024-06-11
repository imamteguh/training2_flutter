import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training2/screens/cart_screen.dart';

import '../providers/cart.dart';
import '../widgets/product_grid.dart';
import '../widgets/badge_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        actions: [
          Consumer<Cart>(
            builder: (context, value, child) {
              return BadgeItem(
                value: value.jumlah.toString(),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  icon: const Icon(Icons.shopping_cart),
                  color: Colors.white,
                ),
              );
            },
          ),
        ],
      ),
      body: ProductGrid(),
    );
  }
}
