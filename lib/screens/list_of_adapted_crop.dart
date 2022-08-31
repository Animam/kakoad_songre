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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GREEN,
        title: Text('Culture Adaptées'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _adatedCrops.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print("Parfait Anicet");
                  },
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                    child: Text(
                      _adatedCrops[index],
                      style: TextStyle(
                        fontSize: 20,
                      ),
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
