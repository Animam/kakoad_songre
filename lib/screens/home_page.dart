import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:kakoad_songre/screens/guide_file.dart';
import 'package:kakoad_songre/screens/guide_sheet_page.dart';
import 'package:kakoad_songre/screens/sign_in.dart';
import 'package:kakoad_songre/screens/suggestion.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../colors.dart';
import 'google_map.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              headerWidget(),
              SizedBox(height: 20),
              const Divider(thickness: 1, height: 10, color: Colors.grey),
              SizedBox(height: 20),
              Expanded(
                child: Column(
                  children: [
                    //Menu side list goes here
                    ListTile(
                      leading: const Icon(
                        Icons.home,
                        color: GREEN,
                      ),
                      title: const Text(
                        'Acceuil',
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                    ),

                    ListTile(
                      leading: const Icon(
                        Icons.settings,
                        color: GREEN,
                      ),
                      title: const Text(
                        'Paramètre',
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.info,
                        color: GREEN,
                      ),
                      title: const Text(
                        'Apropos',
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: () {
                        //Direct to about  us page
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()));
                    } on FirebaseAuthException catch (e) {
                      print(e.message);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'Se deconnecter',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.logout_outlined,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Acceuil'),
        centerTitle: true,
        backgroundColor: GREEN,
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          // Image(image: AssetImage('images/kl.jpeg')),
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                image: DecorationImage(
                  image: AssetImage('images/home_background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // SizedBox(height: 60,),
          Expanded(
            flex: 8,
            child: Container(
              // height: 400,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: GREEN,
                          primary: Colors.white,
                          minimumSize: Size(250, 10)),
                      child: Text(
                        'Voir les sols',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GoogleMapScreen()),
                        );
                      },
                    ),
                    SizedBox(height: 25),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: GREEN,
                          primary: Colors.white,
                          minimumSize: Size(250, 10)),
                      child: Text(
                        'Voir fiches de Guide',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        await Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Suggestion()));

                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget headerWidget() {
    const image = 'images/profile.jpeg';
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 40, 0, 24),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(image),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Anicet SEDOGO',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'anicetsedogo@gmail.com',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  // void openPDF(BuildContext context, File file) => Navigator.of(context).push(
  //   MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
  // );
}

class PdfList extends StatefulWidget {
  PdfList({Key? key}) : super(key: key);

  @override
  State<PdfList> createState() => _PdfListState();
}

class _PdfListState extends State<PdfList> {
  late Future<ListResult> futureFiles;

  @override
  Widget build(BuildContext context) {
    futureFiles = FirebaseStorage.instance.ref('/files').listAll();
    return FutureBuilder<ListResult>(
      future: futureFiles,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final files = snapshot.data!.items;
          return Scaffold(
            appBar: AppBar(
              title: Text("Liste PDF"),
            ),
            body: ListView.builder(
                itemCount: files.length,
                itemBuilder: (context, index) {
                  final file = files[index];
                  return ListTile(
                    title: Text(file.name),
                    trailing: IconButton(
                      icon: Icon(Icons.download),
                      onPressed: () async {
                       // await dowloadFile(file);
                        final url = file.name;
                        final filed = await PdfAPI.loadFirebase(url);
                        //
                        if (filed == null) return;
                        openPDF(context, filed);
                      },
                    ),
                  );
                }),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error Ocurred"),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );

  Future dowloadFile(Reference ref) async{
    final url = await ref.getDownloadURL();


    final dir = await getApplicationDocumentsDirectory();
    final filed =File('${dir.path}/${ref.name}');

    await ref.writeToFile(filed);
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Downloaded ${ref.name}')));
  }
}
