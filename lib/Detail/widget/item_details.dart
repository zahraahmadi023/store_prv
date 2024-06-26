import 'package:flutter/material.dart';
import 'package:store_prv/Screen/contanrs.dart';
import 'package:store_prv/model/model_product.dart';

class ItemDetail extends StatefulWidget {
  final Product product;

  ItemDetail({super.key, required this.product});

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  int CurrentImage = 0;

  int CurrentColor = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          widget.product.title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(
          "${widget.product.price}",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.product.rate}",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 15,
                    )
                  ],
                )),
            SizedBox(
              width: 5,
            ),
            Text(
              widget.product.review,
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Sellar " + widget.product.seller,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            "color",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
            children: List.generate(
                widget.product.colors.length,
                (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          CurrentColor = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(microseconds: 300),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: CurrentColor == index
                                ? Colors.white
                                : widget.product.colors[index],
                            border: CurrentColor == index
                                ? Border.all(
                                    color: widget.product.colors[index])
                                : null),
                        padding:
                            CurrentColor == index ? EdgeInsets.all(2) : null,
                        margin: EdgeInsets.only(right: 10),
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              color: widget.product.colors[index],
                              shape: BoxShape.circle),
                        ),
                      ),
                    ))),
        // Description(),
      ],
    );
  }
}
