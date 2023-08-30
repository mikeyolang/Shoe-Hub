import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:shoehub/shared/appstyle.dart';
import 'package:shoehub/shared/checkout_button.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  final _cartBox = Hive.box("cart_box");
  @override
  Widget build(BuildContext context) {
    List<dynamic> cart = [];
    final cartData = _cartBox.keys.map((key) {
      final item = _cartBox.get(key);
      return {
        "id": key,
        "name": item["name"],
        "price": item["price"],
        "imageUrl": item["imageUrl"],
        "size": item["size"],
        "quantity": item["quantity"],
      };
    }).toList();
    cart = cartData.reversed.toList();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              Text(
                "My Cart",
                style: appstyle(36, Colors.black, FontWeight.w500),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: ListView.builder(
                  itemCount: cart.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final data = cart[index];
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        child: Slidable(
                          key: const ValueKey(0),
                          endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (value){
                                    _cartBox.delete(data["id"]);
                                  },
                                  foregroundColor: Colors.white,
                                  label: "Delete",
                                  backgroundColor: Colors.red,
                                  icon: Icons.delete,
                                )
                              ]),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade500,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade500,
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Image.asset(
                                        data["imageUrl"],
                                        width: 70,
                                        height: 70,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, bottom: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data["name"],
                                            style: appstyle(
                                              18,
                                              Colors.black,
                                              FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            data["category"],
                                            style: appstyle(
                                              16,
                                              Colors.black,
                                              FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "\$${data["price"]}",
                                                style: appstyle(
                                                  15,
                                                  Colors.black,
                                                  FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Size: ${data["size"]}",
                                                style: appstyle(
                                                  15,
                                                  Colors.black,
                                                  FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CheckoutButton(label: "Proceed to Checkout"),
            ),
          ),
        ],
      ),
    ));
  }
}
