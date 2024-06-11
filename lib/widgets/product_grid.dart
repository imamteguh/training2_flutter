import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training2/providers/products.dart';

import './product_item.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Products>(context);
    final product = data.products;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: product.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: product[i],
        child: ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
