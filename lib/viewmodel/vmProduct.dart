import 'package:navgiter/data/Data.dart';
import 'package:navgiter/models/Product.dart';

class VmProduct {
  static List<Map<Product, int>> cartItems = [];
  static addToCart({required p, int qty = 1}) {
    Map<Product, int> items = {};
    items[p] = qty;
    cartItems.add(items);
  }

  List<Product> loadAllProducts() {
    Data db = Data();
    return db.select().map((e) => Product.fromMap(e)).toList();
  }
}
