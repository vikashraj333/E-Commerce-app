import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kcontentColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey,
            size: 30,
          ),
          10.widthBox,
          Flexible(
            flex: 4,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search....",
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 25,
            width: 1.5,
            color: Colors.grey,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.tune,
              color: Colors.grey,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
