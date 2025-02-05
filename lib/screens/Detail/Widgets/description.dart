import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Description extends StatelessWidget {
  final String description;
  const Description({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                color: kprimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: "Description".text.white.bold.size(16).make(),
            ),
            "Specifications".text.black.bold.size(16).make(),
            "Reviews".text.black.bold.size(16).make(),
          ],
        ),
        20.heightBox,
        description.text.color(Colors.grey).size(16).make(),
      ],
    );
  }
}
