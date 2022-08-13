// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kakoad_songre/colors.dart';
import 'package:kakoad_songre/screens/adapted_crops.dart';

void bottomSheet(context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ouest du village du vale",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 15),
                Image.network(
                    'https://media.gerbeaud.net/2014/09/640/sol-argileux.jpg'),
                SizedBox(height: 25),
                Text(
                  'Sol argileux',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Azote 20%'),
                    Text('Phospore 30%'),
                    Text('sable 23%'),
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AdaptedCropsPage() ));
                  },
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('culture adaptée',style: TextStyle(fontSize: 20, color: GREEN))),
                )
              ],
            ),
          ),
        );
      });
}
