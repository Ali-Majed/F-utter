import 'dart:convert';

import 'package:app_apii/api/api_settings.dart';
import 'package:app_apii/api/controllers/api_utils.dart';
import 'package:app_apii/models/api_response.dart';
import 'package:app_apii/models/task.dart';

import 'package:http/http.dart' as http;

class TaskApiController extends ApiUtils{

  Future<ApiResponse> createTask(Task task) async{
    Uri uri=Uri.parse(ApiSettings.tasks.replaceFirst('/{id}', ""));
    var response= await http.post(uri,body: {'title':task.title},headers: headers );
    if(response.statusCode==201||response.statusCode==400){
      var jsonResponse = jsonDecode(response.body);
      var apiResponse = ApiResponse<Task>(
          jsonResponse['message'], jsonResponse['status']);
      if(response.statusCode==201){
        Task task=Task.fromJson(jsonResponse['data']);
        apiResponse.object=task;
      }
      return apiResponse;
    }
    return ApiResponse("Something went wrong , try again!", false);
  }


  Future<List<Task>> getTask() async{
    Uri uri=Uri.parse(ApiSettings.tasks.replaceFirst('/{id}',""));
    var response= await http.get(uri,headers: headers);
    if(response.statusCode==200){
      var jsonResponse = jsonDecode(response.body);
      var dataJsonArray = jsonResponse['data'] as List;
      return dataJsonArray.map((element) => Task.fromJson(element)).toList();

    }
    print(response.statusCode);
    return[];
  }

  Future<ApiResponse> updateTask(int id ,Task task) async{


    Uri uri=Uri.parse(ApiSettings.tasks.replaceFirst("{id}", id.toString()));
    var response=await http.put(uri,headers: headers,body: {'title':task.title});
    if(response.statusCode==200||response.statusCode==400){
      var jsonResponse = jsonDecode(response.body);
      var apiResponse = ApiResponse<Task>(
          jsonResponse['message'], jsonResponse['status']);

      return apiResponse;
    }
    print(response.statusCode);

    return ApiResponse("message");
  }

  Future<ApiResponse> deleteTask(int id) async{
    Uri uri = Uri.parse(ApiSettings.tasks.replaceFirst("{id}", id.toString()));
    var response = await http.delete(uri, headers: headers);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(jsonResponse['message'], jsonResponse['status']);
    }
    print(response.statusCode);

    return ApiResponse("Something went wrong , try again!", false);
  }

}