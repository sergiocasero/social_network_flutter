import 'dart:io';
import 'dart:typed_data';

import 'package:photo_manager/photo_manager.dart';

class Media {
  final String id;
  final Uint8List thumb;
  final AssetEntity file;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final bool backup;

  Media({this.id, this.thumb, this.file, this.createdDate, this.modifiedDate, this.backup});
}
