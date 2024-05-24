import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_textfeild.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProduct extends StatefulWidget {
  // we convert it to statefull cause the ui will change
  static String id = 'UpdatePage';

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? name, description, image, price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)!.settings.arguments
        as ProductModel; // to recieve product old info that i will update
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Update Product',
            style: TextStyle(fontSize: 22),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                CustomTextFeild(
                  hint: 'Product Name',
                  onChanged: (data) {
                    name = data;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                CustomTextFeild(
                  hint: 'description',
                  onChanged: (data) {
                    description = data;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                CustomTextFeild(
                  InputType: TextInputType.number,
                  hint: 'price',
                  onChanged: (data) {
                    price = data;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                CustomTextFeild(
                  hint: 'image',
                  onChanged: (data) {
                    image = data;
                  },
                ),
                SizedBox(
                  height: 70,
                ),
                CustomButton(
                  onTap: ()async {
                    isLoading = true;
                    setState(() {});
                    try {
                
                    await  UpdateProduct(product);
                    } on Exception catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> UpdateProduct(ProductModel product) async {
   await UpdateProductService().updateProduct(
    id:product.id,
        title: name==null? product.title : name!,
        price: price==null? product.price.toString() : price!,
        desc: description==null? product.description : description!,
        image: image==null?product.image: image!,
        category: product.category);
  }
}
