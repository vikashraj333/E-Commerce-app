import 'package:e_commerce_app/models/category.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        //separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(categoriesList[index].image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              5.heightBox,
              Text(
                categoriesList[index].title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
