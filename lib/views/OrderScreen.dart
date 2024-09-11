import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OrderScreen> {
  GlobalKey<FormState> frm = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? pay = 'pay1';
  bool isTermAccepted = false;
  bool isPolicyAccepted = false;
  String? selectedTime = null;
  //CityVm cvm = CityVm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 130,
                margin: EdgeInsets.only(
                  top: 0.0,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    color: Color.fromARGB(255, 150, 93, 160)),
                child: Center(
                  child: Text(
                    "Order Screen",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(20),
                //height: 700,
                child: Form(
                  key: frm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: nameController,
                        validator: (x) {
                          if (x != null && x.isNotEmpty) {
                            if (isThreePartName(x) == true) {
                              return null;
                            }
                            return " Enter Correct name";
                          }
                        },
                        decoration: InputDecoration(
                          label: Text("Customer name :"),
                          hintText: "Muzoon ahmed",
                          prefixIcon: Icon(
                            Icons.account_box_rounded,
                            color: Color.fromARGB(255, 150, 93, 160),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: phoneController,
                        validator: (e) {
                          if (e != null && e.isNotEmpty) {
                            if (checkPhoneNumber(e) == true) {
                              return null;
                            }
                            return "error";
                          }
                        },
                        decoration: InputDecoration(
                            label: Text("Phone_Number : "),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Color.fromARGB(255, 150, 93, 160),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      DropdownButton(
                        value: selectedTime,
                        hint: Text("Deliver Time"),
                        items: [
                          DropdownMenuItem(
                            child: Text("Afternoon"),
                            value: 'af',
                          ),
                          DropdownMenuItem(
                            child: Text("Night"),
                            value: 'ni',
                          ),
                          DropdownMenuItem(
                            child: Text("Morning"),
                            value: 'mo',
                          ),
                        ],
                        onChanged: (x) {
                          selectedTime = x!;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 200,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 218, 183, 224)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Upon Recive :"),
                            Row(
                              children: [
                                Radio(
                                    value: "pay1",
                                    groupValue: pay,
                                    onChanged: (x) {
                                      pay = x;
                                      setState(() {});
                                    }),
                                Text("Upon Recive"),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: "pay2",
                                    groupValue: pay,
                                    onChanged: (x) {
                                      pay = x;
                                      setState(() {});
                                    }),
                                Text("Omqy Payment"),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: "pay3",
                                    groupValue: pay,
                                    onChanged: (x) {
                                      pay = x;
                                      setState(() {});
                                    }),
                                Text("Kuraimi Payment"),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          label: Text("Customer Notes:"),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5.0),
                          height: 50,
                          width: 250,
                          child: ElevatedButton(
                              onPressed: () {
                                if (frm.currentState!.validate() && selectedTime != null && pay!= null) {
                                  Navigator.pushNamed(context, '/recive');
                                } else {
                                 print("incrorrect data") ;
                              //    nameController.text = " ";
                              //    phoneController.text = " ";
                                 // setState(() {});
                                }
                              },
                              child: Text(
                                "Order",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 150, 93, 160),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool? checkPhoneNumber(String number) {
    // RegExp regExp = RegExp(r'^(70|71|77|78|73)[0-9]{6}$');
    //return regExp.hasMatch(number);
    if (number.length == 9) {
      if (number[0] == "7" &&
          (number[1] == "1" ||
              number[1] == "3" ||
              number[1] == "7" ||
              number[1] == "8" ||
              number[1] == "0")) return true;
    }
  }

  bool? isThreePartName(String name) {
    name = nameController.text;
    List<String> nameParts = name.trim().split(" ");
    if (nameParts.length >= 3) return true;
  }
}
