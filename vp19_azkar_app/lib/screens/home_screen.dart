import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vp19_azkar_app/screens/about_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  String _content = 'أستغفر الله';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // automaticallyImplyLeading: Navigator.canPop(context),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "مسبحة الأذكار",
          style: GoogleFonts.tajawal(),
        ),
        actions: [
          // IconButton(
          //   onPressed: () {
          //     Navigator.pushNamed(
          //       context,
          //       '/info_screen',
          //       // arguments: 'message',
          //       arguments: <String, dynamic>{
          //         'message': 'New Message Received',
          //       },
          //     );
          //   },
          //   icon: Icon(Icons.info),
          // ),
          // IconButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => AboutScreen(message: "About App"),
          //       ),
          //     );
          //   },
          //   icon: Icon(Icons.warning),
          // ),

          PopupMenuButton<String>(
            onSelected: (value) {
              if(value != _content) {
                setState(() {
                  _content = value;
                  _counter = 0;
                });
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('سبحان الله'),
                  value: 'سبحان الله',
                  textStyle: GoogleFonts.tajawal(
                    color: Colors.black,
                  ),
                  height: 25,
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  child: Text('الحمدلله'),
                  value: 'الحمدلله',
                  textStyle: GoogleFonts.tajawal(
                    color: Colors.black,
                  ),
                  height: 25,
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  child: Text('أستغفر الله'),
                  value: 'أستغفر الله',
                  textStyle: GoogleFonts.tajawal(
                    color: Colors.black,
                  ),
                  height: 25,
                ),
              ];
            },
          )
        ],
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Colors.teal.shade300,
              Colors.blue.shade300,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 15),
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _content,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.tajawal(
                        fontWeight: FontWeight.bold,
                        height: 2,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    color: Colors.blue.shade200,
                    child: Text(
                      _counter.toString(),
                      style: GoogleFonts.tajawal(
                        fontWeight: FontWeight.bold,
                        height: 2,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() => ++_counter);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Text(
                        'تسبيح',
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() => _counter = 0);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Text(
                        'إعادة',
                        style: GoogleFonts.tajawal(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade800,
        child: Icon(Icons.add),
        onPressed: () {
          setState(() => ++_counter);
        },
      ),
    );
  }
}
