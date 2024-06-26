import 'package:flutter/material.dart';
import 'package:store_prv/Provider/favorait_provider.dart';
import 'package:store_prv/Screen/contanrs.dart';

class FavoraitScreen extends StatefulWidget {
  const FavoraitScreen({super.key});

  @override
  State<FavoraitScreen> createState() => _FavoraitScreenState();
}

class _FavoraitScreenState extends State<FavoraitScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoraitProvider.of(context);
    final finalCart = provider.favorait;
    return Scaffold(
      body: Scaffold(
          backgroundColor: kcontantCoolor,
          appBar: AppBar(
            title: Center(child: Text("favorait")),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: finalCart.length,
                  itemBuilder: (context, index) {
                    final cartItem = finalCart[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                Container(
                                  height: 120,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.asset(cartItem.image),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartItem.title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      cartItem.title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "\$${cartItem.price}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 40,
                            right: 35,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      finalCart.removeAt(index);
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
