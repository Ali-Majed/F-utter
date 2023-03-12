import 'package:coursse_flutter_ui_app/app/bottom_navigation/bottom_navigation_screen.dart';
import 'package:coursse_flutter_ui_app/app/bottom_navigation/catogories_screen.dart';
import 'package:coursse_flutter_ui_app/app/bottom_navigation/home_screen.dart';
import 'package:coursse_flutter_ui_app/app/bottom_navigation/products_screeen.dart';
import 'package:coursse_flutter_ui_app/app/bottom_navigation/setting_screen.dart';
import 'package:coursse_flutter_ui_app/app/drawer/first_faqs_screen.dart';
import 'package:coursse_flutter_ui_app/app/drawer/first_team_screen.dart';
import 'package:coursse_flutter_ui_app/app/drawer/second_faqs_screen.dart';
import 'package:coursse_flutter_ui_app/app/drawer/second_team_screen.dart';
import 'package:coursse_flutter_ui_app/app/screens/launch_screen.dart';
import 'package:coursse_flutter_ui_app/app/screens/outboarding_screen.dart';
import 'package:coursse_flutter_ui_app/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            iconTheme:IconThemeData(
                color: Colors.black
            ) ,
          elevation:0,
          backgroundColor: Colors.white,
          titleTextStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18

          )


        )
      ),
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen':(context) => const LaunchScreen(),
        '/out_boarding_screen':(context) => const OutBoardingScreen(),
        '/login_screen':(context) => const LoginScreen(),
        '/home_screen':(context) => const HomeScreen(),
        '/products_screen':(context) => const ProductsScreen(),
        '/categories_screen':(context) => const CategoriesScreen(),
        '/bottom_navigation_screen':(context) => const BottomNavigationScreen(),
        '/Settings_screen':(context) => const SettingsScreen(),
        '/first_faqs_screen':(context) => const FirstFAQsScreen(),
        '/second_faqs_screen':(context) => const SecondFAQsScreen(),
        '/first_team_screen':(context) => const FirstTeamScreen(),
        '/second_team_screen':(context) => const SecondTeamScreen(),

      },

    );
  }
}
