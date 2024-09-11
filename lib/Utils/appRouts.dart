import 'package:flutter/material.dart';
import 'package:navgiter/models/Product.dart';
import 'package:navgiter/views/CartScreen.dart';
import 'package:navgiter/views/DefaultScreen.dart';
import 'package:navgiter/views/DetailsScreen.dart';
import 'package:navgiter/views/HomeScreen.dart';
import 'package:navgiter/views/OrderScreen.dart';
import 'package:navgiter/views/reciveScreen.dart';

class AppRouts {
  static Route<dynamic>? routManager(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (ctx) => HomeScreen());
      case '/details':
        {
          Product product = settings.arguments as Product;
          return MaterialPageRoute(
            builder: (ctx) => DetailsScreen(
              p: product,
            ),
          );
        }
      case '/cart':
        {
          List<Map<Product, int>> cartItems =
              settings.arguments as List<Map<Product, int>>;
          return MaterialPageRoute(
              builder: (ctx) => CartScreen(cart: cartItems));
        }
      case '/order':
        return MaterialPageRoute(builder: (ctx) => OrderScreen());
      case '/recive':
        return MaterialPageRoute(builder: (ctx) => ReciveScreen());
      default:
        return MaterialPageRoute(builder: (ctx) => DefaultScreen());
    }
  }
}
