class CrudEvents {}

class UploadEvent extends CrudEvents{
  final String path;

  UploadEvent(this.path);
}
class ReadEvent extends CrudEvents{}

class DeletedEvent extends CrudEvents{
  final int index;

  DeletedEvent(this.index);
}
