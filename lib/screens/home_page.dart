import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.cartPlus,
                  color: Colors.black,
                ))
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'New Trend',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(right: 10, left: 10, top: 30),
          child: FutureBuilder<List<ProductModel>>(
              future: AllProductsService().getAllProducts(),
              builder: (context, snapshot) { // determine what will appears on screen 
                if (snapshot.hasData) { // insure that the data state=> snapshot has data to show it
                  List<ProductModel> products = snapshot.data!;
                  return GridView.builder(
                      clipBehavior: Clip.none,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 230),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return CustomCard(product: products[index]);
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }
}
