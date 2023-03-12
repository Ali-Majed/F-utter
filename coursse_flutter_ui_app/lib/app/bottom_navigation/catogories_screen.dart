import 'package:coursse_flutter_ui_app/models/catogories.dart';
import 'package:coursse_flutter_ui_app/widgets/catogory_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Catogories> _catogories = <Catogories>[
    Catogories("images/catogry_0.png", "New Arrivals", "160 Product"),
    Catogories("images/catogry_1.png", "Clothes", "123 Product"),
    Catogories("images/catogry_2.png", "Bags", "189 Product"),
    Catogories("images/catogry_3.png", "Shoese", "159 Product"),
    Catogories("images/catogry_4.png", "Jewelry ", "165 Product"),
    Catogories("images/catogry_5.png", "Electronics", "140 Product"),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        // childAspectRatio: 132 / 214
      ),
      itemBuilder: (context, index) {
        return Container(
          child: Stack(
            children: [
              Image.asset(
                _catogories[index].image,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0x99FFFFFF),

                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Column(
                    children: [
                      Text(
                        _catogories[index].name,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(_catogories[index].number_product)
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
