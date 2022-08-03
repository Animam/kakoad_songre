
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void bottomSheet(context){

  showModalBottomSheet(
    backgroundColor: Colors.transparent,
      context: context,
      builder: (context){
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Soil information",
              style: TextStyle(
                fontSize: 25,

              ),),
            ],
          ),
        );

      } );
}
