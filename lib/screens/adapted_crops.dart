import 'package:flutter/material.dart';
import 'package:kakoad_songre/colors.dart';
import 'list_no_adapted_crops.dart';
import 'list_of_adapted_crop.dart';

class AdaptedCropsPage extends StatefulWidget {
  late Map data;
  AdaptedCropsPage({Key? key, required this.data});

  @override
  State<AdaptedCropsPage> createState() => _AdaptedCropsPageState();
}

class _AdaptedCropsPageState extends State<AdaptedCropsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choix de cultures'),
        centerTitle: true,
        backgroundColor: GREEN,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  color: GREEN,
                  image: DecorationImage(
                      image: AssetImage('images/guerre-des-semences.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(285, 30),
                          backgroundColor: GREEN,
                          primary: Colors.white),
                      child: const Text(
                        'Cultures adaptées',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ListAdaptedCrops(data: widget.data)),
                        );
                      },
                    ),
                    SizedBox(height: 25),
                    TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(250, 30),
                          backgroundColor: GREEN,
                          primary: Colors.white),
                      child: const Text(
                        'Cultures non-adaptées',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListNoAdaptedCrops(
                                    data: widget.data,
                                  )),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
