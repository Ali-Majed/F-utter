class Note{

  late String id;
  late String title;
  late String info;

  Note();

  Note.fromMap(Map<String, dynamic> documentMap){
    title = documentMap['title'];
    info = documentMap['info'];
  }

  Map<String,dynamic> toMap(){
    Map<String, dynamic> map=<String,dynamic>{};
    map['title'] =title;
    map['info'] =info;
    return map;
  }
}