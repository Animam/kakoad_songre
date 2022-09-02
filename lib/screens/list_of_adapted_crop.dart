import 'package:flutter/material.dart';
import 'package:kakoad_songre/colors.dart';

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
    List image_culture = widget.data[""];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GREEN,
        title: Text('Liste des cultures adaptées'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _adatedCrops.length,
              itemBuilder: (context, index) {
                var _ = _adatedCrops[index].toString().split("|");
                return GestureDetector(
                  onTap: () {
                    print("Parfait Anicet");
                  },
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          _.elementAt(0),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "apte a (aux)" + _.elementAt(1),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
