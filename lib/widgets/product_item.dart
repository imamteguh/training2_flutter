import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../screens/product_detail_screen.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, item, child) => IconButton(
              icon: (item.isFavorite)
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border_outlined),
              color: Colors.amber,
              onPressed: () {
                item.statusFav();
              },
            ),
          ),
          title: Text(
            "${item.title}",
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Berhasil ditambahkan"),
                  duration: Duration(
                    milliseconds: 500,
                  ),
                ),
              );
              cart.addCart(item.id, item.title, item.price, item.imageUrl);
            },
            color: Colors.amber,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: item.id,
            );
          },
          child: Image.network(
            "${item.imageUrl}",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
