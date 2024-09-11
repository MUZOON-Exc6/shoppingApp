import 'package:navgiter/models/Product.dart';

class VmCart {
  static double? calcTotalAmount(List<Map<Product, int>> items) {
    double total = 0;
    for (var e in items) {
      e.forEach((key, value) {
        total += key.price * value;
      });
      return total;
    }
    return null;
  }
}
