import 'package:flutter/material.dart';
import 'package:store_prv/Screen/contanrs.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(backgroundColor: kcontantCoolor),
          onPressed: () {},
          icon: Image.asset(
            "images/icon.png",
            height: 30,
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(backgroundColor: kcontantCoolor),
          onPressed: () {},
          icon: Icon(Icons.notification_add_outlined),
        )
      ],
    );
  }
}
