class CartItem {
  String id;
  String title;
  double price;
  int qty;
  String? imageUrl;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.qty,
    this.imageUrl,
  });
}
