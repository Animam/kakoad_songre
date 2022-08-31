import 'package:flutter/material.dart';
import 'package:kakoad_songre/colors.dart';

class ListNoAdaptedCrops extends StatefulWidget {
  late Map data;
  ListNoAdaptedCrops({Key? key, required this.data});

  @override
  State<ListNoAdaptedCrops> createState() => _ListNoAdaptedCropsState();
}

class _ListNoAdaptedCropsState extends State<ListNoAdaptedCrops> {
  @override
  Widget build(BuildContext context) {
    List _noAdaptedCrops = widget.data["culture_inapte"].toString().split(",");

    return Scaffold(
      appBar: AppBar(
        title: Text('Culture Non Adaptées'),
        backgroundColor: GREEN,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _noAdaptedCrops.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  child: Text(
                    _noAdaptedCrops[index],
                    style: TextStyle(fontSize: 20),
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
