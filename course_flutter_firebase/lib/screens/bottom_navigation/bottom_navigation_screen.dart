import 'package:course_flutter_firebase/firebase/fb_auth_controller.dart';
import 'package:course_flutter_firebase/models/bn_item.dart';
import 'package:course_flutter_firebase/screens/firestore/home_screen.dart';
import 'package:course_flutter_firebase/screens/storage/images_screen.dart';
import 'package:course_flutter_firebase/utils/context_extenssion.dart';
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
    const BnItem("Note", HomeScreen()),
    const BnItem("Images", ImagesSrceen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_local()), actions: [
        IconButton(
          onPressed: () => _showLogoutDialog(),
          icon: const Icon(Icons.logout),
        ),
      ]),
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
                Icons.person_outline,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.person,
              ),
              label: context.localizations.note),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.image_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.image,
              ),
              label: context.localizations.image),

        ],
      ),
    );
  }



  String _local(){
    if(_currentIndex==0){
      return context.localizations.note;
    }else {
      return context.localizations.image;
    }
  }

  void _showLogoutDialog() async {
    bool? result = await showDialog<bool>(
        barrierDismissible: false,
        barrierColor: Colors.black45,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10,
            backgroundColor: Colors.white,
            title: Text(context.localizations.confirm_logout),
            titleTextStyle: GoogleFonts.poppins(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            content: Text(context.localizations.sure),
            contentTextStyle: GoogleFonts.poppins(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text(context.localizations.yes)),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text(context.localizations.no))
            ],
          );
        });

    if (result ?? false) {
      await FbAuthController().signOut();
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
  }

}
