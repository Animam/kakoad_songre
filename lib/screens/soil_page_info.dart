// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
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
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sols ferrugineux tropicaux lessivés indurés superficiels(FLIS)",textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: 15),

                  Text(
                    'Ce sol a un niveau de fertilité très élevé ',textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: 25),
                  TextButton(
                    onPressed: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>AdaptedCropsPage(data: specify) ));
                    },
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('Voir cultures',style: TextStyle(fontSize: 20, color: GREEN))),
                  )
                ],
              ),
            ),
          ),
        );
      });

}
