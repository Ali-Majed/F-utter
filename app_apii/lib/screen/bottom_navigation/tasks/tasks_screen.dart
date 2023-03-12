import 'package:app_apii/get/tasks_get_controller.dart';
import 'package:app_apii/models/api_response.dart';
import 'package:app_apii/screen/bottom_navigation/tasks/update_task_screen.dart';
import 'package:app_apii/utils/context_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<TasksGetController>(
        init: TasksGetController(),
        global:  true,
        builder: (controller){
          if(controller.loading.isTrue){
            return Center(child: CircularProgressIndicator());
          }else if(controller.tasks.isNotEmpty){
            return ListView.builder(
              itemCount: controller.tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.task),
                  title: Text(controller.tasks[index].title),
                  trailing:  IconButton(
                      onPressed: () => _deleteTask(context, index),
                      icon: Icon(Icons.delete_outline_rounded)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateTaskScreen(task: controller.tasks[index],),
                        ));
                  },
                );
              },
            );
          }else {
            return Center(child: Text('NO Tasks',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black45,
              ),),);
          }

        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff870160),
        onPressed: ()=> Navigator.pushNamed(context, '/create_task_screen'),

        child: Icon(Icons.add_task),

      ),
    );
  }

  void _deleteTask(BuildContext context,int index) async{
    ApiResponse response=await TasksGetController.to.delete(index);
    context.showSnackBar(message: response.message,error: !response.success);
  }
}
