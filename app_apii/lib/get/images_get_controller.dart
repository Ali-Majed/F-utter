import 'package:app_apii/api/controllers/images_api_controller.dart';
import 'package:app_apii/models/api_response.dart';
import 'package:app_apii/models/student_image.dart';
import 'package:get/get.dart';

class ImagesGetController extends GetxController {
  static ImagesGetController get to => Get.find<ImagesGetController>();

  RxBool loading = false.obs;
  RxList<StudentImage> images = <StudentImage>[].obs;
  final ImagesApiController _apiController = ImagesApiController();

  @override
  void onInit() {
    read();
    super.onInit();
  }

  Future<ApiResponse> upload(String path) async {
    ApiResponse<StudentImage> response = await _apiController.uploadImage(path);
    if (response.success && response.object != null) {
      images.add(response.object!);
    }
    return response;
  }

  void read() async {
    loading.value = true;
    images.value = await _apiController.read();
    loading.value = false;
  }

  Future<ApiResponse> delete(int index) async {
    ApiResponse response = await _apiController.delete(images[index].id);
    if (response.success) {
      images.removeAt(index);
    }
    return response;
  }
}
