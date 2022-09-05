import 'dart:convert';
//import 'dart:js_util';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:kakoad_songre/screens/firebase_img_file.dart';


class FirebaseApi {
  static Future<List<String>> _getDownloadLink(List<Reference> refs)=>
    Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());



  static Future<List<FirebaseImageFile>> listAll(String path) async{
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();

    final urls = await _getDownloadLink(result.items);
    var valueToReturn = urls
        .asMap()
        .map((index, url){
      final ref = result.items[index];
      final name = ref.name;
      final fileImg = FirebaseImageFile(ref: ref, name:name, url:url);
      //print("--------------${fileImg}");
      return MapEntry(index, fileImg);
    })
        .values
        .toList();
    //print(valueToReturn);
    return valueToReturn;
  }
}