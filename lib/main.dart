import 'package:flutter/material.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_product.dart';

void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProduct.id:(context)=>UpdateProduct(),
      },
      initialRoute: HomePage.id,
    );
  }
}
