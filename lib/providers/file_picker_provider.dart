import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

class FilePickerProvider  {
  static Future<File?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['.xls','.xlsx']
    );

    if (result != null && result.files.single.path!=null) {
      File file = File(result.files.single.path!);
      return file;
    } 
  }
}
