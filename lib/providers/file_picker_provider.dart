import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

class FilePickerProvider {
  static Future<dynamic> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null ) {
      
      return (result.files.single);
    }
  }
}
