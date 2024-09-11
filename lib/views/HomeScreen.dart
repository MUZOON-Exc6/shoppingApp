import 'package:flutter/material.dart';
import 'package:navgiter/models/Product.dart';
import 'package:navgiter/viewmodel/vmProduct.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  //vmProduct vmp = vmProduct();
  VmProduct pVM = VmProduct();
  @override
  Widget build(BuildContext context) {
    List<Product> allProducts = pVM.loadAllProducts();
    return Scaffold(
        backgroundColor: Color(0XFFFEF9EB),
        appBar: AppBar(
          title: const Text("Jolly Chick Stor"),
          backgroundColor: Color.fromARGB(255, 150, 93, 160),
          actions: [
            Container(
              margin: const EdgeInsets.only(top: 10, right: 10),
              child: Badge(
                label: Text("${VmProduct.cartItems.length}"),
                child: Icon(Icons.add_shopping_cart),
              ),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: allProducts.length,
            itemBuilder: (ctx, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/details',
                      arguments: allProducts[index]);
                },
                child: Card(
                  child: Column(
                    children: [
                      Image.asset(allProducts[index].image),
                      ListTile(
                        leading: InkWell(
                          onTap: () {
                            VmProduct.addToCart(p: allProducts[index]);
                          },
                          child: Icon(Icons.add_shopping_cart),
                        ),
                        subtitle: Text(allProducts[index].brand),
                        title: Text(allProducts[index].name),
                        trailing: Text('${allProducts[index].price}'),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
