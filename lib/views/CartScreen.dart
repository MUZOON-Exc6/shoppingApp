import 'package:flutter/material.dart';
import 'package:navgiter/models/Product.dart';
import 'package:navgiter/viewmodel/VmCart.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  late List<Map<Product, int>> cart;
  CartScreen({super.key, required this.cart});

  //late int id =0 ;
  //CartScreen({required id});
  @override
  Widget build(BuildContext context) {
    //int id = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      backgroundColor: const Color(0XFFFEF9EB),
      appBar: AppBar(
        title: const Text("Jolly Chick Cart"),
        backgroundColor: const Color.fromARGB(255, 150, 93, 160),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 2 / 3,
              child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    return buildCartList(
                        cart[index].keys.first, cart[index].values.first);
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider();
                  },
                  itemCount: cart.length),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 1 / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 150, 93, 160),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Items",
                        style: TextStyle(color: Colors.white,fontSize: 18),
                      ),
                      Text("${cart.length}",style: TextStyle(fontSize: 18 , color: Colors.white)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total",style: TextStyle(fontSize: 18 , color: Colors.white),),
                      Text(VmCart.calcTotalAmount(cart)!.toStringAsFixed(2),style: TextStyle(fontSize: 18 , color: Colors.white)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/order');
                  },
                  child: Text(
                    "Order Now",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 150, 93, 160),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  buildCartList(Product p, int qty) {
    return ListTile(
      leading: Image.asset(p.image),
      title: Text(p.name),
      trailing: Text(p.price.toString()),
      subtitle: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 150, 93, 160)),
              child: const Center(
                child: Text("+"),
              ),
            ),
            Text(qty.toString()),
            Container(
              margin: const EdgeInsets.all(5),
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 150, 93, 160)),
              child: const Center(
                child: Text("-"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
