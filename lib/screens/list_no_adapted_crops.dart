import 'package:flutter/material.dart';
import 'package:kakoad_songre/colors.dart';
import 'package:kakoad_songre/screens/suggestion.dart';
class ListNoAdaptedCrops extends StatefulWidget {
  const ListNoAdaptedCrops({Key? key}) : super(key: key);

  @override
  State<ListNoAdaptedCrops> createState() => _ListNoAdaptedCropsState();
}

class _ListNoAdaptedCropsState extends State<ListNoAdaptedCrops> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Culture Non Adaptées'),
        backgroundColor: GREEN,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Liste des cultures non adaptées',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),
            Card(
              child: ListTile(

                // leading: Image.asset('images/Culture-maraichere-bio.jpg'),
                title: Text('Inapte en permanence',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                subtitle: Text(
                  'Cultures maraîchères',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 25),
            Card(
              child: ListTile(

                // leading: Image.asset('images/Planter-des-arachides.jpg'),
                title: Text('Inapte en permanence',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                subtitle: Text(
                  'culture irriguées',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
