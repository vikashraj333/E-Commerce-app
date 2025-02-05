import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/screens/Detail/Widgets/add_to_cart.dart';
import 'package:e_commerce_app/screens/Detail/Widgets/description.dart';
import 'package:e_commerce_app/screens/Detail/Widgets/detail_app_bar.dart';
import 'package:e_commerce_app/screens/Detail/Widgets/detail_image_slider.dart';
import 'package:e_commerce_app/screens/Detail/Widgets/items_details.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentColor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      //for add to cart, quantity
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //for back button and share button
              DetailAppBar(
                product: widget.product,
              ),
              // for product image
              DetailImageSlider(
                  image: widget.product.image,
                  onChange: (index) {
                    setState(() {
                      currentImage = index;
                    });
                  }),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => AnimatedContainer(
                    duration: Duration(microseconds: 300),
                    width: currentImage == index ? 15 : 8,
                    height: 8,
                    margin: EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentImage == index
                            ? Colors.black
                            : Colors.transparent,
                        border: Border.all(color: Colors.black)),
                  ),
                ),
              ),
              20.heightBox,
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //for product name, description, rating and seller
                    ItemsDetails(product: widget.product),
                    20.heightBox,
                    "Color".text.size(22).bold.make(),
                    //for colors
                    Row(
                      children: List.generate(
                        widget.product.colors.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              currentColor = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentColor == index
                                  ? Colors.white
                                  : widget.product.colors[index],
                              border: currentColor == index
                                  ? Border.all(
                                      color: widget.product.colors[index],
                                    )
                                  : null,
                            ),
                            padding: currentColor == index
                                ? EdgeInsets.all(2)
                                : null,
                            margin: EdgeInsets.only(right: 10),
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: widget.product.colors[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    25.heightBox,
                    //for description
                    Description(description: widget.product.description)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
