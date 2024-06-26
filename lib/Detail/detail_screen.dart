import 'package:flutter/material.dart';
import 'package:store_prv/Detail/widget/add_to_cart.dart';
import 'package:store_prv/Detail/widget/appbar_detail.dart';
import 'package:store_prv/Detail/widget/description.dart';
import 'package:store_prv/Detail/widget/image_slider_det.dart';
import 'package:store_prv/Detail/widget/item_details.dart';
import 'package:store_prv/Screen/contanrs.dart';
import 'package:store_prv/model/model_product.dart';

class DetailScreen extends StatefulWidget {
  final Product pruduct;
  const DetailScreen({super.key, required this.pruduct});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int CurrentImage = 0;
  int currentSlide = 0;
  int currentColor = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddToCArt(
        product: widget.pruduct,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: kcontantCoolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppbarDetail(product: widget.pruduct),
              SizedBox(
                height: 20,
              ),
              ImageSliderDetail(
                image: widget.pruduct.image,
                OnChang: (index) {
                  setState(() {
                    CurrentImage = index;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 180),
                child: Row(
                  children: List.generate(
                    3,
                    (index) => AnimatedContainer(
                      duration: Duration(microseconds: 300),
                      width: currentSlide == index ? 15 : 8,
                      height: 8,
                      margin: EdgeInsets.only(right: 3),
                      decoration: BoxDecoration(
                          color: currentSlide == index
                              ? Colors.black
                              : Colors.transparent,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding:
                    EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 180),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // for product name, price, rating, and seller
                    ItemDetail(product: widget.pruduct),
                    const SizedBox(height: 25),
                    // for description
                    Description(
                      description: widget.pruduct.description,
                    )
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
