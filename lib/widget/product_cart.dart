import 'package:flutter/material.dart';
import 'package:store_prv/Detail/detail_screen.dart';
import 'package:store_prv/Provider/favorait_provider.dart';
import 'package:store_prv/Screen/contanrs.dart';
import 'package:store_prv/model/model_product.dart';

class ProductCart extends StatelessWidget {
  final Product product;
  ProductCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoraitProvider.of(context);
    return GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                pruduct: product,
              ),
            )),
        child: Stack(
          children: [
            Container(
              // color: Colors.white,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kcontantCoolor,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Hero(
                      tag: product.image,
                      child: Image.asset(
                        product.image,
                        height: 130,
                        width: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      product.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${product.price}",
                          style: TextStyle(fontSize: 17),
                        ),
                        Row(
                            children: List.generate(
                                product.colors.length,
                                (index) => Container(
                                      height: 18,
                                      width: 18,
                                      margin: EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                        color: product.colors[index],
                                        shape: BoxShape.circle,
                                      ),
                                    )))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    provider.toggelFavorait(product);
                  },
                  child: Icon(
                    provider.isExite(product)
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    size: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
          ],
        ));
  }
}
