import 'dart:ui';

import 'package:course_flutter_firebase/firebase/fb_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      String route=FbAuthController().loggedIn ? "/navigation_screen" : "/login_screen";
      print(FbAuthController().loggedIn);
      Navigator.pushReplacementNamed(context, route );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: [
                Color(0xff1f005c),
                Color(0xff5b0060),
                Color(0xff870160),
                Color(0xffac255e),
                Color(0xffca485c),
                Color(0xffe16b5c),
                Color(0xfff39060),
                Color(0xffffb56b),
              ]        ,    tileMode: TileMode.mirror,
          )
        ),
        child:Center(
          child: Text('FIREBASE APP' , style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),),
        ),

        

      ),
    );
  }
}
