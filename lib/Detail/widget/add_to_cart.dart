import 'package:flutter/material.dart';
import 'package:store_prv/Provider/cart_provider.dart';
import 'package:store_prv/Screen/contanrs.dart';
import 'package:store_prv/model/model_product.dart';

class AddToCArt extends StatefulWidget {
  final Product product;
  const AddToCArt({super.key, required this.product});

  @override
  State<AddToCArt> createState() => _AddToCArtState();
}

class _AddToCArtState extends State<AddToCArt> {
  @override
  Widget build(BuildContext context) {
    final Provider = CartProvider.of(context);
    int currentIndex = 1;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 85,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Row(children: [
                  IconButton(
                      iconSize: 18,
                      color: Colors.white,
                      onPressed: () {
                        if (currentIndex != 1) {
                          setState(() {
                            currentIndex--;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.remove,
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    currentIndex.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  IconButton(
                      iconSize: 18,
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          currentIndex++;
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                      )),
                ]),
              ),
              GestureDetector(
                onTap: () {
                  Provider.toggelFavorait(widget.product);
                  var snackbar = const SnackBar(
                      content: Text(
                        "seccessfull add to cart",
                        style: TextStyle(color: Colors.white),
                      ),
                      duration: Duration(seconds: 1));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      color: kprimaryColor),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Center(
                      child: Text(
                        "Add To cart",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
