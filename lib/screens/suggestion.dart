import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:kakoad_songre/colors.dart';
import 'package:kakoad_songre/screens/guide_file.dart';
import 'dart:io';

import 'package:kakoad_songre/screens/guide_sheet_page.dart';
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';

//import 'package:path/path.dart' as Path
class Suggestion extends StatefulWidget {
  const Suggestion({Key? key}) : super(key: key);

  @override
  State<Suggestion> createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  late Future<ListResult> futureFiles;
  bool errorHasOccurred = false;
  @override
  Widget build(BuildContext context) {
    futureFiles = FirebaseStorage.instance.ref('/files').listAll();
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggestion'),
        centerTitle: true,
        backgroundColor: GREEN,
      ),
      body: FutureBuilder<ListResult>(
        future: futureFiles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final files = snapshot.data!.items;
            var fileb;
            print(files);
            return ListView.builder(
                itemCount: files.length,
                itemBuilder: (context, index) {
                  var file = files[index];
                  return ListTile(
                    title: Text(file.name),
                    trailing: IconButton(
                      icon: Icon(Icons.download),
                      onPressed: () async{
                        await dowloadFile(file);
                        final url = Path.dirname(file.fullPath)+Path.separator+file.name;
                        print("-----------------vbvbv--------"+url);
                        fileb = await PdfAPI.loadFirebase(url);

                        if (fileb == null) return;
                        openPDF(context, fileb);
                      },
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(
              child: errorHasOccurred == true? Text("Error Occurred"): null,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
  void openPDF(BuildContext context, File fileb) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PDFViewerPage(file: fileb)),
  );

  Future dowloadFile(Reference ref) async{
    final url = await ref.getDownloadURL();

    final dir = await getApplicationDocumentsDirectory();
    var path = '${dir.path}/${ref.name}';
    // final file =File(path);

    //await ref.writeToFile(file);
    await Dio().download(url, path);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Downloaded ${ref.name}')));
  }
 }
