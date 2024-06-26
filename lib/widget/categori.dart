import 'package:flutter/material.dart';
import 'package:store_prv/model/model_category.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex1 = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 140,
        child: ListView.builder(
          itemCount: categoryList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex1 = index;
                });
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: selectedIndex1 == index
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
        ));
  }
}
