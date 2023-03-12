
import 'package:firebase_storage/firebase_storage.dart';

enum ProcessType{upload,delete}

class CrudState{
}

class LoadingState extends CrudState{}

class ProcessState extends CrudState{

  final String message;
  final bool success;
  final ProcessType processType;

  ProcessState(this.message, this.success, this.processType);
}


class ReadState extends CrudState{
  List<Reference> references;

  ReadState(this.references);
}
