import 'package:flutter/material.dart';
import 'package:kakoad_songre/colors.dart';

class GuideSheetPage extends StatefulWidget {
  const GuideSheetPage({Key? key}) : super(key: key);

  @override
  State<GuideSheetPage> createState() => _GuideSheetPageState();
}

class _GuideSheetPageState extends State<GuideSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des fiches de Guide'),
        backgroundColor: GREEN,
      ),
      body: Center(

      ),
    );
  }
}
