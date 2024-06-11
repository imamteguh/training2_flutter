import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training2/screens/cart_screen.dart';

import '../providers/cart.dart';
import '../providers/products.dart';
import '../widgets/badge_item.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final product = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
          backgroundColor: Theme.of(context).colorScheme.primary,
          titleTextStyle: const TextStyle(
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
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              child: Image.network(
                "${product.imageUrl}",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "${product.title}",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "\$${product.price}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "${product.description}",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Berhasil ditambahkan"),
                    duration: Duration(
                      milliseconds: 500,
                    ),
                  ),
                );
                cart.addCart(
                    product.id, product.title, product.price, product.imageUrl);
              },
              child: Text("Add to cart"),
            ),
          ],
        ));
  }
}
