import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_prv/Provider/cart_provider.dart';
import 'package:store_prv/Provider/favorait_provider.dart';
import 'package:store_prv/Screen/btm_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => FavoraitProvider())
      ], child: MaterialApp(theme: ThemeData(), home: BottomNavBar()));
}
