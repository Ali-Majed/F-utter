import 'package:flutter/material.dart';

class Catogory extends StatelessWidget {
  const Catogory(
      {required this.image,
      required this.name,
      required this.number_product,
      Key? key})
      : super(key: key);
  final String image;
  final String name;
  final String number_product;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          Image.asset(image),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              name,
              textAlign: TextAlign.center,
            ),
          ),
          Text(number_product)
        ],
      ),
    ]);
  }
}
