import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakoad_songre/colors.dart';

class AdaptedCropsPage extends StatefulWidget {
  const AdaptedCropsPage({Key? key}) : super(key: key);

  @override
  State<AdaptedCropsPage> createState() => _AdaptedCropsPageState();
}

class _AdaptedCropsPageState extends State<AdaptedCropsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Culture Adaptées'),
        centerTitle: true,
        backgroundColor: GREEN,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          // color: Colors.grey,
          child: ListView(
            children: [
              Container(
                height: 100,
                width: 300,
                color: Colors.red,
              ),
              SizedBox(height: 25,),
              Container(
                height: 300,
                width: 400,
                // color: Colors.green,
                child: Column(
                  children:const [
                    Text('Sol FLIPP'),
                    Text('-	Marginalement apte pour les cultures pluviales de mil, sorgho, maïs, arachide, niébé, sésame et la sylviculture \n '
                        '-	Inapte en permanence pour le riz pluvial et irrigué, le cotonnier l’arboriculture fruitière (bananier, manguier, agrumes et goyavier)'
                        ' et toute autre culture irriguée ou maraîchère',style: TextStyle(fontSize: 20),)
                  ],
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
