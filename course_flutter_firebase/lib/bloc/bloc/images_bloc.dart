import 'package:course_flutter_firebase/bloc/events/crud_event.dart';
import 'package:course_flutter_firebase/bloc/states/crud_state.dart';
import 'package:course_flutter_firebase/firebase/fb_storage_controller.dart';
import 'package:course_flutter_firebase/models/firebase_respones.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagesBloc extends Bloc<CrudEvents, CrudState> {
  ImagesBloc(super.initialState) {
    on<UploadEvent>(_onUploadEvent);
    on<ReadEvent>(_onReadEvent);
    on<DeletedEvent>(_onDeleteEvent);
  }

  List<Reference> _reference = <Reference>[];
  final FbStorageController _controller = FbStorageController();

  void _onUploadEvent(UploadEvent event, Emitter<CrudState> emit) async {
    TaskSnapshot snapshot = await _controller.upload(event.path).whenComplete(() => null);
    if (snapshot.state == TaskState.success) {
      _reference.add(snapshot.ref);
      emit(ReadState(_reference));
      emit(ProcessState("Upload Completed", true, ProcessType.upload));
    } else if (snapshot.state == TaskState.error) {
      emit(ProcessState("Upload Failed", false, ProcessType.upload));
    }
  }

  void _onReadEvent(ReadEvent event, Emitter<CrudState> emit) async {
    emit(LoadingState());
    _reference = await _controller.read();
    emit(ReadState(_reference));
  }

  void _onDeleteEvent(DeletedEvent event, Emitter<CrudState> emit) async {
    FirebaseResponse response =
        await _controller.delete(_reference[event.index].fullPath);
    if (response.success) {
      _reference.removeAt(event.index);
      emit(ReadState(_reference));
    }
    emit(ProcessState(response.message, response.success, ProcessType.delete));
  }
}
