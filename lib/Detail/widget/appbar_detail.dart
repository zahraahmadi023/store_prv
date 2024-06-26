import 'package:flutter/material.dart';
import 'package:store_prv/Provider/favorait_provider.dart';
import 'package:store_prv/model/model_product.dart';

class AppbarDetail extends StatelessWidget {
  final Product product;
  const AppbarDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoraitProvider.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
          ),
          Spacer(),
          IconButton(
            style: IconButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
          IconButton(
            style: IconButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {
              provider.toggelFavorait(product);
            },
            icon: Icon(provider.isExite(product)
                ? Icons.favorite
                : Icons.favorite_border),
          )
        ],
      ),
    );
  }
}
