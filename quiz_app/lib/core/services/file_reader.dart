import 'dart:io';

import 'package:file_picker/file_picker.dart';
import '../errors/file_read_exception.dart';

class FileReader {

  FileReader._();

  static Future<String> pickFileAndRead() async{
    final filePath = await _pickFile();
    if(filePath != null) {
      return await _readFile(filePath);
    } else {
      throw FileReadException('No file selected');
    }
  }

  static Future<String?> _pickFile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'],
    );
    if(result != null) {
      return result.files.single.path!;
    } else {
      return null;
    }
  }

  static Future<String> _readFile(String filePath) async{
    final file = File(filePath);

    try {
      return await file.readAsString();
    } catch (exception) {
      throw FileReadException(exception.toString());
    }
  }
}