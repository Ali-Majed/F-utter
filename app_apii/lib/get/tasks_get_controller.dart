

import 'package:app_apii/api/controllers/task_api_controller.dart';
import 'package:app_apii/models/api_response.dart';
import 'package:app_apii/models/task.dart';
import 'package:get/get.dart';

class TasksGetController extends GetxController{
  static TasksGetController get to => Get.find<TasksGetController>();

  RxList<Task> tasks=<Task>[].obs;
  RxBool loading = false.obs;

  final TaskApiController _taskApiController= TaskApiController();

  @override
  void onInit() {

    read();
    super.onInit();

  }
  Future<ApiResponse> create(Task task) async {
    ApiResponse response = await _taskApiController.createTask(task);
    if (response.success && response.object != null) {
      tasks.add(task);
    }
    return response;
  }
  void read() async{
    loading.value = true;
    tasks.value=await _taskApiController.getTask();
    loading.value = false;
  }

  Future<ApiResponse> updateNote(int index1, Task task) async {

    ApiResponse apiResponse = await _taskApiController.updateTask(index1
        ,task);
     // int index = tasks.indexWhere((element) => element.id == task.getId());

    if (apiResponse.success && apiResponse.object != null) {
      tasks[index1] =task;
    }
    return apiResponse;


  }

  Future<ApiResponse> delete(int index) async {
    ApiResponse response = await _taskApiController.deleteTask(tasks[index].id);
    if (response.success) {
      tasks.removeAt(index);
    }
    return response;
  }

}