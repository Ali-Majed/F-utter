import 'package:course_flutter_data_app/get/note_getx_controller.dart';
import 'package:course_flutter_data_app/models/process_respones.dart';
import 'package:course_flutter_data_app/prefs/shared_pref_controller.dart';
import 'package:course_flutter_data_app/provider/note_provider.dart';
import 'package:course_flutter_data_app/screens/note_screen.dart';
import 'package:course_flutter_data_app/utils/context_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NoteGetXController controller =
      Get.put<NoteGetXController>(NoteGetXController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.home),
        actions: [
          IconButton(
              onPressed: () {
                _showLogoutDialog();
              },
              icon: Icon(Icons.logout)),
          IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NoteScreen())),
              icon: Icon(Icons.note_add_outlined))
        ],
      ),
      body: Obx(() {
        if (controller.loading.isTrue) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.notes.isNotEmpty) {
          return ListView.builder(
              itemCount: controller.notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.note),
                  title: Text(controller.notes[index].title),
                  subtitle: Text(controller.notes[index].info),
                  trailing: IconButton(
                    onPressed: () => deleteNote(index),
                    icon: Icon(Icons.delete),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NoteScreen(note: controller.notes[index]),
                        ));
                  },
                );
              });
        } else {
          return Center(
            child: Text(
              context.localizations.no_notes,
              style: GoogleFonts.poppins(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),
          );
        }
      }),

      // body: GetX<NoteGetXController>(
      //   init: NoteGetXController(),
      //   builder: (NoteGetXController controller){
      //     if (controller.notes.isNotEmpty) {
      //       return ListView.builder (
      //           itemCount: controller.notes.length,
      //           itemBuilder: (context, index) {
      //             return ListTile(
      //               leading: Icon(Icons.note),
      //               title: Text(controller.notes[index].title),
      //               subtitle: Text(controller.notes[index].info),
      //               trailing: IconButton(
      //                 onPressed: () => deleteNote(index),
      //                 icon: Icon(Icons.delete),
      //               ),
      //               onTap: () {
      //                 Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) =>
      //                           NoteScreen(note: controller.notes[index]),
      //                     ));
      //               },
      //             );
      //           });
      //     } else {
      //       return Center(
      //         child: Text(
      //           context.localizations.no_notes,
      //           style: GoogleFonts.poppins(
      //               fontSize: 30, fontWeight: FontWeight.bold),
      //         ),
      //       );
      //     }
      //   },
      // )
    );
  }

  void deleteNote(int index) async {
    ProcessResponse processResponse = await NoteGetXController.to.delete(index);

    context.showSnackBar(processResponse.message, !processResponse.success);
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
      await SharedPrefController().removeValueFor(PrefKeys.loggedIn.name);
      bool deleted = await Get.delete<NoteGetXController>();
      Future.delayed(Duration(microseconds: 500), () {
        Navigator.pushReplacementNamed(context, '/login_screen');
      });
    }
  }
}
