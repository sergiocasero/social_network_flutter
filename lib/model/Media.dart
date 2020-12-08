import 'dart:io';
import 'dart:typed_data';

class Media {
  final String id;
  final Uint8List thumb;
  final Future<File> file;
  final DateTime createdDate;
  final DateTime modifiedDate;

  Media({this.id, this.thumb, this.file, this.createdDate, this.modifiedDate});
}
