import 'package:e_commerce_app/Provider/cart_provider.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/screens/Cart/check_out.dart';
import 'package:e_commerce_app/screens/nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;
    // for quantity
    productQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add
                ? provider.incrementQtn(index)
                : provider.decrementQtn(index);
          });
        },
        child: Icon(
          icon,
          size: 20,
        ),
      );
    }

    return Scaffold(
      // for bottom checkout
      bottomSheet: CheckOutBox(),
      backgroundColor: kcontentColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavBar(),
                        ),
                      );
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  "My Cart".text.size(25).bold.make(),
                  Container(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: finalList.length,
                itemBuilder: (context, index) {
                  final cartItem = finalList[index];
                  return Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: kcontentColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Image.asset(cartItem.image),
                              ),
                              10.widthBox,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  cartItem.title.text.size(16).bold.make(),
                                  5.heightBox,
                                  cartItem.category.text
                                      .size(14)
                                      .bold
                                      .color(Colors.grey.shade400)
                                      .make(),
                                  10.heightBox,
                                  "\$${cartItem.price}"
                                      .text
                                      .size(14)
                                      .bold
                                      .make(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 35,
                        right: 35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                finalList.removeAt(index);
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 25,
                              ),
                            ),
                            10.heightBox,
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: kcontentColor,
                                border: Border.all(
                                    color: Colors.grey.shade200, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  10.widthBox,
                                  productQuantity(Icons.remove, index),
                                  10.widthBox,
                                  cartItem.quantity
                                      .toString()
                                      .text
                                      .black
                                      .bold
                                      .make(),
                                  10.widthBox,
                                  productQuantity(Icons.add, index),
                                  10.widthBox,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
