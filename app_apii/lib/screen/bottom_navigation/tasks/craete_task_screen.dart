import 'package:app_apii/get/tasks_get_controller.dart';
import 'package:app_apii/models/api_response.dart';
import 'package:app_apii/models/task.dart';
import 'package:app_apii/pref/shared_pref_controller.dart';
import 'package:app_apii/utils/context_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  late TextEditingController _createTaskTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createTaskTextController = TextEditingController();
  }

  @override
  void dispose() {
    _createTaskTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            context.localizations.create_task,
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Column(
            children: [
              TextField(
                controller:_createTaskTextController ,
                style: GoogleFonts.poppins(),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: context.localizations.create_task,
                  hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(Icons.task),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 2,
                      strokeAlign: StrokeAlign.center,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue.shade700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _preform(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff870160),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(context.localizations.save),
              ),
            ],
          ),
        ));
  }

  void _preform() async {
    if (_checkData()) {
      await _save();
    }
  }

  bool _checkData() {
    if (_createTaskTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message:  context.localizations.error_data, error: true);
    return false;
  }

  Future<void> _save() async {
    ApiResponse apiResponse=await TasksGetController.to.create(task);

    print(!apiResponse.success);
    context.showSnackBar(message: apiResponse.message, error: !apiResponse.success);
  }

  Task get task{
    Task task=Task();
    task.title=_createTaskTextController.text;
    task.studentId=SharedPrefController().getValueFor<int>(key:PrefKey.id.name);
    return task;
  }

}
