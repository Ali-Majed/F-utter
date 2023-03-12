import 'package:coursse_flutter_ui_app/models/catogories.dart';
import 'package:coursse_flutter_ui_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> _product=<Product>[
    Product("images/product0.png", "T shirt", "154"),
    Product("images/product1.png", "shoes", "69"),
    Product("images/product2.png", "Bag", "53"),
    Product("images/product3.png", "shoes", "21"),
    Product("images/product4.png", "Hedphone", "65"),
    Product("images/product5.png", "Bag", "55"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(itemBuilder: (context, index) {
          return ListTile(
            leading:Image.asset(_product[index].image) ,
            title: Text(_product[index].name),
            subtitle: Text(_product[index].price),
            trailing: Icon(Icons.arrow_forward_ios,size: 18,),
          );
        }, separatorBuilder: (context, index) {
          return Divider();
        }, itemCount: 6
        )
    );

    // ListView(
    //   children: [
    //     ListTile(
    //       leading:Icon(Icons.qr_code_2) ,
    //       title: Text("Product Name"),
    //       subtitle: Text("Product info"),
    //       trailing: Icon(Icons.arrow_forward_ios,size: 18,),
    //     )
    //   ],
    // ),
//**********************************************************************************
    // ListView.builder(
    //   itemCount: 5,
    //   physics: AlwaysScrollableScrollPhysics(),
    //   shrinkWrap: true,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       leading:Icon(Icons.qr_code_2) ,
    //       title: Text("Product Name"),
    //       subtitle: Text("Product info"),
    //       trailing: Icon(Icons.arrow_forward_ios,size: 18,),
    //     );
    //   },
    //
    // ),
  }
}




