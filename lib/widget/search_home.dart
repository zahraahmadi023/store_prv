import 'package:flutter/material.dart';
import 'package:store_prv/Screen/contanrs.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          color: kcontantCoolor, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: 30,
              color: Colors.grey,
            ),
            Flexible(
                flex: 4,
                child: TextField(
                    decoration: InputDecoration(
                        hintText: "search..", border: InputBorder.none))),
            Container(
              height: 25,
              width: 1.5,
              color: Colors.grey,
            ),
            Icon(
              Icons.tune,
              size: 30,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
