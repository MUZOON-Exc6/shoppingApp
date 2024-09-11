import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:navgiter/models/Product.dart';
import 'package:navgiter/viewmodel/vmProduct.dart';

class DetailsScreen extends StatefulWidget {
  late Product p;
  DetailsScreen({Key? key, required this.p}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late String img;
  @override
  void initState() {
    img = widget.p.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Product p = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 93, 160),
        title: Text(widget.p.name),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/cart',
                  arguments: VmProduct.cartItems);
            },
            child: Container(
              margin: EdgeInsets.only(top: 10, right: 10),
              child: Badge(
                label: Text('${VmProduct.cartItems.length}'),
                child: Icon(Icons.add_shopping_cart),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(img),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: widget.p.thumbnails
                    .map((e) => InkWell(
                          onTap: () {
                            img = e;
                            setState(() {});
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 100, height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[300],
                                image: DecorationImage(
                                    image: AssetImage(e), fit: BoxFit.cover)),
                            // child: Center(
                            //child: Image.asset(e), ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.p.brand),
                  Text(widget.p.price.toString())
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(widget.p.describtion),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          VmProduct.addToCart(p: widget.p, qty: 1);
          Fluttertoast.showToast(
              msg: "product added to cart ",
              toastLength: Toast.LENGTH_SHORT,
              timeInSecForIosWeb: 1,
              fontSize: 16.0);
        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
