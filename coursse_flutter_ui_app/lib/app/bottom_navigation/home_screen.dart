import 'package:coursse_flutter_ui_app/models/catogories.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Catogories> _catogories=<Catogories>[
    Catogories("images/catogry_0.png", "New Arrivals", "160 Product"),
    Catogories("images/catogry_1.png", "Clothes", "123 Product"),
    Catogories("images/catogry_2.png", "Bags", "189 Product"),
    Catogories("images/catogry_3.png", "Shoese", "159 Product"),
    Catogories("images/catogry_4.png", "Jewelry ", "165 Product"),
    Catogories("images/catogry_5.png", "Electronics", "140 Product"),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Text('Categories',
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
          SizedBox(height: 20,),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: 100
            ),
            child: GridView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Container(
                  child: Image.asset(_catogories[index].image),

                );
              },
            ),

            // child: ListView.builder(
            //     itemCount: 10,
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context , index){
            //       return Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Container(
            //           height: 100,
            //           width: 100,
            //           color: Colors.grey,
            //         ),
            //       );
            //     }),
          ),
          SizedBox(height: 20,),
          Text('Favorite Products',
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
          SizedBox(height: 10,),
          GridView.builder(
            itemCount: 4,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                crossAxisSpacing: 10
            ),
            itemBuilder: (context,index){
              return Container(
                child: Image.asset('images/image$index.png'),
              );
            },
          )
          ,SizedBox(height: 20,)
          ,Text('Product',style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),)
          ,SizedBox(height: 10,)
          ,ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 5,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsetsDirectional.only(bottom: 10),
                height: 100,
                // color: index % 2== 0 ?Colors.pink.shade100 :Colors.blue.shade100,
                child: Image.asset('images/pruduct_$index.png'),

              );
            },)


        ],
      ),
    );
  }
}
