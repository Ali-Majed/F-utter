import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppPage extends StatelessWidget {
  const AppPage({
    required this.image,
    required this.title,
    required this.content,
    Key? key,
  }) : super(key: key);

  final String image;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/$image.png',height: 300,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: Column(
            children: [
              Text(title
                ,style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0xFF23203F)
                ),
              ),
              SizedBox(height: 21,),
              Text(content
                ,style: GoogleFonts.openSans(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF716F87)
                ),textAlign: TextAlign.center,),
            ],
          ),
        )
      ],
    );
  }
}
