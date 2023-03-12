import 'dart:io';

import 'package:app_apii/get/images_get_controller.dart';
import 'package:app_apii/models/api_response.dart';
import 'package:app_apii/utils/context_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  double? _progressValue = 0;
  late ImagePicker _imagePicker ;
  XFile? _pickedImage;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(context.localizations.upload_image),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            minHeight: 8,
            backgroundColor: Colors.orange.shade200,
            color: Colors.green.shade500,
            value: _progressValue,
            ),
            
          Expanded(child: _pickedImage != null ? Image.file(File(_pickedImage!.path)):

          IconButton(onPressed: () => _pickImage() ,
            icon: const Icon(Icons.camera),
            iconSize: 48,
          ),
          ),

          ElevatedButton.icon(
            onPressed: () => _performUpload(),
            icon: Icon(Icons.cloud_upload),
            label: Text(context.localizations.upload),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff870160),
            minimumSize: Size(double.infinity,50),
          ),
          ),

        ],
      ),
    );

  }
  void _pickImage() async {
    XFile? _image = await _imagePicker.pickImage(source: ImageSource.camera,imageQuality: 80);
    if(_image != null){
      setState(() => _pickedImage = _image);
    }
  }
  void _performUpload(){
    if(_checkData()){
      _uploadImage();
    }
  }

  bool _checkData(){
   if(_pickedImage !=null){
     return true;
   }
   context.showSnackBar(message: "Pick image to upload ",error:  true);
   return false;
  }

  Future<void> _uploadImage() async {
    _uploadProgressValue();
    ApiResponse apiResponse =
    await ImagesGetController.to.upload(_pickedImage!.path);
    _uploadProgressValue(value: apiResponse.success ? 1:0);
    if(apiResponse.success){
      setState(() => _pickedImage = null);
    }

    context.showSnackBar(message: apiResponse.message, error: !apiResponse.success);
  }

  void _uploadProgressValue({double? value}) async {
    setState(() => _progressValue = value );
  }

}
