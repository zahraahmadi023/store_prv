import 'package:flutter/material.dart';
import 'package:store_prv/Screen/Favorait/favorait_screen.dart';
import 'package:store_prv/Screen/Home/home_screen.dart';
import 'package:store_prv/Screen/basket_screen.dart';
import 'package:store_prv/Screen/contanrs.dart';
import 'package:store_prv/Screen/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int cuttentIndex = 2;
  List Screens = const [
    Scaffold(),
    FavoraitScreen(),
    Home(),
    BasketScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              cuttentIndex = 2;
            });
          },
          shape: CircleBorder(),
          backgroundColor: kprimaryColor,
          child: IconButton(
            onPressed: () {
              setState(() {
                cuttentIndex = 2;
              });
            },
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          elevation: 1,
          height: 60,
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      cuttentIndex = 0;
                    });
                  },
                  icon: Icon(
                    Icons.grid_view_outlined,
                    size: 30,
                    color: cuttentIndex == 0
                        ? kprimaryColor
                        : Colors.grey.shade400,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      cuttentIndex = 1;
                    });
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    size: 30,
                    color: cuttentIndex == 1
                        ? kprimaryColor
                        : Colors.grey.shade400,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      cuttentIndex = 3;
                    });
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                    color: cuttentIndex == 3
                        ? kprimaryColor
                        : Colors.grey.shade400,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      cuttentIndex = 4;
                    });
                  },
                  icon: Icon(
                    Icons.person,
                    size: 30,
                    color: cuttentIndex == 4
                        ? kprimaryColor
                        : Colors.grey.shade400,
                  ),
                ),
                // IconButton(
                //     onPressed: () {
                //       setState(() {
                //         cuttentIndex = 2;
                //       });
                //     },
                //     icon: Icon(
                //       Icons.grid_view_outlined,
                //       size: 30,
                //       color: cuttentIndex == 2 ? kprimaryColor : Colors.grey,
                //     )),
                // IconButton(
                //     onPressed: () {
                //       setState(() {
                //         cuttentIndex = 3;
                //       });
                //     },
                //     icon: Icon(
                //       Icons.favorite_border_outlined,
                //       size: 30,
                //       color: cuttentIndex == 3 ? kprimaryColor : Colors.grey,
                //     )),
                // SizedBox(
                //   width: 15,
                // ),
                // IconButton(
                //     onPressed: () {
                //       setState(() {
                //         cuttentIndex = 0;
                //       });
                //     },
                //     icon: Icon(
                //       Icons.shopping_cart_checkout_outlined,
                //       size: 30,
                //       color: cuttentIndex == 0 ? kprimaryColor : Colors.grey,
                //     )),
                // IconButton(
                //     onPressed: () {
                //       setState(() {
                //         cuttentIndex = 4;
                //       });
                //     },
                //     icon: Icon(
                //       Icons.person,
                //       size: 30,
                //       color: cuttentIndex == 4 ? kprimaryColor : Colors.grey,
                //     )),
              ])),
      body: Screens[cuttentIndex],
    );
  }
}
