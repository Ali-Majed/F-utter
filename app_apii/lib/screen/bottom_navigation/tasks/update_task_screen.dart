import 'package:app_apii/get/tasks_get_controller.dart';
import 'package:app_apii/models/api_response.dart';
import 'package:app_apii/models/task.dart';
import 'package:app_apii/pref/shared_pref_controller.dart';
import 'package:app_apii/utils/context_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateTaskScreen extends StatefulWidget {
  const UpdateTaskScreen({Key? key,this.task}) : super(key: key);

  final Task? task;


  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  late TextEditingController _UpdateTaskTextController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _UpdateTaskTextController = TextEditingController(text: widget.task?.title);
  }

  @override
  void dispose() {
    _UpdateTaskTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            context.localizations.update_task,
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: _UpdateTaskTextController ,
                style: GoogleFonts.poppins(),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: context.localizations.update_task,
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
                child: Text(context.localizations.update),
              ),
            ],
          ),
        ));
  }

  void _preform() async {
    if (_checkData()) {
      await _updateTask();
    }
  }

  bool _checkData() {
    if (_UpdateTaskTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: context.localizations.error_data, error: true);
    return false;
  }

  Future<void> _updateTask() async {
    ApiResponse apiResponse=await TasksGetController.to.updateNote(widget.task!.id,task);
    print(widget.task!.id);

    print(!apiResponse.success);
    context.showSnackBar(message: apiResponse.message, error: !apiResponse.success);
  }

  Task get task{
    Task task=Task();
    task.title=_UpdateTaskTextController.text;
    task.studentId=SharedPrefController().getValueFor<int>(key:PrefKey.id.name);
    return task;
  }

}
