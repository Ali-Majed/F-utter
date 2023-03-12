class Task {
    late int id;
  late String title;
  late dynamic studentId;
  late String createdAt;
  late String updatedAt;
  late bool isDone;

  Task();

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    studentId = json['student_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isDone = json['is_done'];
  }
   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['title'] = this.title;
     data['student_id'] = this.studentId;
     data['updated_at'] = this.updatedAt;
     data['created_at'] = this.createdAt;
     data['id'] = this.id;
     data['is_done'] = this.isDone;
     return data;
   }


}