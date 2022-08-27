import 'package:flutter/material.dart';
import 'package:kakoad_songre/colors.dart';
import 'package:kakoad_songre/screens/home_page.dart';
import 'package:kakoad_songre/screens/suggestion.dart';
import 'google_map.dart';

class ListAdaptedCrops extends StatefulWidget {
  late Map data;
  ListAdaptedCrops({Key? key, required this.data});

  @override
  State<ListAdaptedCrops> createState() => _ListAdaptedCropsState();
}

class _ListAdaptedCropsState extends State<ListAdaptedCrops> {
  @override
  Widget build(BuildContext context) {
    List _adatedCrops = widget.data["culture_apte"].toString().split(",");
    print(_adatedCrops);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GREEN,
        title: Text('Culture Adaptées'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /*Text(""
              ,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),

            SizedBox(height: 25),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Suggestion()));
                },
                leading: Image.asset('images/Mais-culture.jpg'),
                title: Text('Marginalement ',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                subtitle: Text(
                  'Apte a la culture du Maïs',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 25),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Suggestion()));
                },
                leading: Image.asset('images/Planter-des-arachides.jpg'),
                title: Text('Marginalement ',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                subtitle: Text(
                  'Apte a la culture d\'arrachide',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 25),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Suggestion()));
                },
                leading: Image.asset('images/sorgho.jpg'),
                title: Text('Marginalement ',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                subtitle: Text(
                  'Apte a la culture du sorgho',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 25),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Suggestion()));
                },
                leading: Image.asset('images/mil.jpg'),
                title: Text('Marginalement ',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                subtitle: Text(
                  'Apte a la culture du mil',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            */
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _adatedCrops.length,
                itemBuilder: (context, index) {
                  return GestureDetector(onTap: (){print("Parfait Anicet");},child: Card(child: Text(_adatedCrops[index])));
                })
          ],
        ),
      ),
    );
  }
}
