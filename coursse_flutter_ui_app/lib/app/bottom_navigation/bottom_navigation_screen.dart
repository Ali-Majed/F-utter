import 'package:coursse_flutter_ui_app/app/bottom_navigation/catogories_screen.dart';
import 'package:coursse_flutter_ui_app/app/bottom_navigation/home_screen.dart';
import 'package:coursse_flutter_ui_app/app/bottom_navigation/products_screeen.dart';
import 'package:coursse_flutter_ui_app/app/bottom_navigation/setting_screen.dart';
import 'package:coursse_flutter_ui_app/models/bn_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  final List<BnItem> _item = <BnItem>[
    const BnItem("Home", HomeScreen()),
    const BnItem("Categories", CategoriesScreen()),
    const BnItem("Product", ProductsScreen()),
    const BnItem("Settings", SettingsScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_item[_currentIndex].title),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Image.asset('images/product0.png'),
              ),
              currentAccountPictureSize: Size(75, 75),
              accountName: Text("Username"),
              accountEmail: Text("email@app.com"),
              otherAccountsPictures: [
                CircleAvatar(child: Icon(Icons.email_outlined),),
                CircleAvatar(child: Icon(Icons.facebook_outlined)),
                CircleAvatar(child: Icon(Icons.call_outlined)),
              ],
              otherAccountsPicturesSize: Size(30, 30),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(Duration(milliseconds: 500),() {
                  Navigator.pushNamed(context, '/first_faqs_screen');

                },);
              },
              leading: Icon(Icons.question_answer_outlined),
              title: Text(
                "FAQs (1)",
                style: GoogleFonts.poppins(fontSize: 13),
              ),
              subtitle: Text(
                "Ferquently Asked Q.",
                style: GoogleFonts.poppins(fontSize: 12),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(Duration(milliseconds: 500),() {
                  Navigator.pushNamed(context, '/second_faqs_screen');

                },);
              },
              leading: Icon(Icons.question_answer_outlined),
              title: Text(
                "FAQs (2)",
                style: GoogleFonts.poppins(fontSize: 13),
              ),
              subtitle: Text(
                "Ferquently Asked Q.",
                style: GoogleFonts.poppins(fontSize: 12),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(Duration(milliseconds: 500),() {
                  Navigator.pushNamed(context, '/first_team_screen');

                },);
              },
              leading: Icon(Icons.question_answer_outlined),
              title: Text(

                "Team (1)",
                style: GoogleFonts.poppins(fontSize: 13),
              ),
              subtitle: Text(
                "Team Members",
                style: GoogleFonts.poppins(fontSize: 12),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(Duration(milliseconds: 500),() {
                  Navigator.pushNamed(context, '/second_team_screen');

                },);
              },
              leading: Icon(Icons.question_answer_outlined),
              title: Text(
                "Team (2)",
                style: GoogleFonts.poppins(fontSize: 13),
              ),
              subtitle: Text(
                "Team Members",
                style: GoogleFonts.poppins(fontSize: 12),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(indent: 20,endIndent: 20,color: Colors.black45,),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(Duration(milliseconds: 500),() {
                  Navigator.pushNamed(context, '/out_boarding_screen');

                },);
              },
              leading: Icon(Icons.border_all_outlined),
              title: Text(
                "Out Boarding Screen",
                style: GoogleFonts.poppins(fontSize: 13),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(Duration(milliseconds: 500),() {
                  Navigator.pushReplacementNamed(context, '/login_screen');

                },);
              },
              leading: Icon(Icons.logout),
              title: Text(
                "Logout",
                style: GoogleFonts.poppins(fontSize: 13),
              ),
              subtitle: Text(
                "Return to login",
                style: GoogleFonts.poppins(fontSize: 12),
              ),
            ),

          ],
        ),
      ),
      body: _item[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() => _currentIndex = index);
        },
        currentIndex: _currentIndex,
        //*************************************
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,

        //*************************************
        // fixedColor: Colors.pink,
        selectedItemColor: Colors.purple,
        selectedIconTheme: IconThemeData(color: Colors.purple.shade900),
        unselectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w300),
        unselectedFontSize: 12,
        //*************************************

        showSelectedLabels: true,
        showUnselectedLabels: true,
        //*************************************

        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.category,
              ),
              label: 'Catogories'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code_2_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.qr_code,
              ),
              label: 'product'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.settings,
              ),
              label: 'Settings'),
        ],
      ),
    );
  }
}
