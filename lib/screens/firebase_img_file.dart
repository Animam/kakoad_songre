import 'package:firebase_storage/firebase_storage.dart';

class FirebaseImageFile {
  final Reference ref;
  final String name;
  final String url;

  FirebaseImageFile({required this.ref, required this.name, required this.url});

  @override
  String toString() {
    // TODO: implement toString
    return "{${this.ref}, ${this.name}, ${this.url}}";

  }
}
