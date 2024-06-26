import 'package:flutter/material.dart';
import 'package:store_prv/model/model_category.dart';
import 'package:store_prv/model/model_product.dart';
import 'package:store_prv/widget/app_bar_home.dart';
import 'package:store_prv/widget/image_slider.dart';
import 'package:store_prv/widget/product_cart.dart';
import 'package:store_prv/widget/search_home.dart';

class Home extends StatefulWidget {
  // final Product product;
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentSlide = 2;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<List<Product>> SelectedCategori = [
      all,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              CustomAppbar(),
              SizedBox(
                height: 10,
              ),
              MySearchBar(),
              SizedBox(
                height: 10,
              ),
              ImageSlider(
                currentSlide: currentSlide,
                onchange: (value) {
                  setState(() {
                    currentSlide = value;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              //Categories(),
              SizedBox(
                  height: 140,
                  child: ListView.builder(
                    reverse: false,
                    itemCount: categoryList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: selectedIndex == index
                                  ? Colors.blue[200]
                                  : Colors.white),
                          child: Column(
                            children: [
                              Container(
                                height: 75,
                                width: 75,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        categoryList[index].image,
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                categoryList[index].title,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    // separatorBuilder: (context, index) => const SizedBox(
                    //       width: 5,
                    //     ),
                  )),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Spicial For You ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("see all",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                ],
              ),
              //for product
              GridView.builder(
                itemCount: SelectedCategori[selectedIndex].length,
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .78,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return ProductCart(
                    product: SelectedCategori[selectedIndex][index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
