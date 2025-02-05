import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemsDetails extends StatelessWidget {
  final Product product;
  const ItemsDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        product.title.text.size(25).fontWeight(FontWeight.w800).make(),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "\$${product.price}"
                    .text
                    .size(25)
                    .fontWeight(FontWeight.w800)
                    .make(),
                10.heightBox,
                // for rating
                Row(
                  children: [
                    Container(
                      width: 55,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kprimaryColor),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.white,
                          ),
                          3.widthBox,
                          product.rate
                              .toString()
                              .text
                              .size(14)
                              .fontWeight(FontWeight.bold)
                              .white
                              .make(),
                        ],
                      ),
                    ),
                    5.widthBox,
                    product.review.text.color(Colors.grey).size(15).make()
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Seller: ",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: product.seller,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
