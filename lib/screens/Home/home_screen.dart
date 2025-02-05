import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/screens/Home/Widgets/home_search_bar.dart';
import 'package:e_commerce_app/screens/Home/Widgets/home_image_slider.dart';
import 'package:e_commerce_app/screens/Home/Widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/category.dart';
import 'Widgets/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCategories = [
      allProducts,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion,
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              25.heightBox,
              //custom app bar
              CustomAppBar(),
              20.heightBox,
              //search bar
              MySearchBar(),
              20.heightBox,
              //image slider
              ImageSlider(
                onChange: (value) {
                  setState(() {
                    currentSlider = value;
                  });
                },
                currentSlide: currentSlider,
              ),
              20.heightBox,
              // for categories
              categoryItems(),
              // for Special for you text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Special For You"
                      .text
                      .size(25)
                      .fontWeight(FontWeight.w800)
                      .make(),
                  "See All"
                      .text
                      .size(16)
                      .fontWeight(FontWeight.w500)
                      .color(Colors.black54)
                      .make(),
                ],
              ),
              // for shopping items
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.78,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: selectedCategories[selectedIndex].length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                        product: selectedCategories[selectedIndex][index]);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox categoryItems() {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: selectedIndex == index
                    ? Colors.blue[200]
                    : Colors.transparent,
              ),
              child: Column(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(categoriesList[index].image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    categoriesList[index].title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
