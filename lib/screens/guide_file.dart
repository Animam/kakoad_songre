// import 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:kakoad_songre/colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

// class CropsList extends StatelessWidget {
//   const CropsList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Liste des cultures'),
//         centerTitle: true,
//         backgroundColor: GREEN,
//       ),
//       // body: SoilInfo(),
//     );
//   }
//
// }
class PdfAPI{


  static Future<File?> loadFirebase(String url) async {
    try {
      print("-------------------------"+url);
      final refPDF = FirebaseStorage.instance.ref().child(url);
      final bytes = await refPDF.getData();

      return _storeFile(url, bytes!);
    } catch (e) {
      print("Great Exception =================== ${e}");
      return null;
    }
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    print("---------------------------------------${filename}");
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}