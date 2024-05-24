import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product.dart';

class CustomCard extends StatelessWidget {
  ProductModel product;
  CustomCard({required this.product});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Navigator.pushNamed(context, UpdateProduct.id,arguments: product);
        // arguments=> to send product old info while we are going to update this info in case we need the old info
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          height: 190,
          width: 250,
          child: Card(
            // use card instead of using contaier cause it has a shadow
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    product.title.substring(0, 10),
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(r'$' '${product.price.toString()}',
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
            child: Positioned(
                bottom: 140,
                right: 8,
                child: Image.network(
                  product.image,
                  height: 110,
                  width: 110,
                )))
      ]),
    );
  }
}
