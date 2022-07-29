// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kakoad_songre/screens/sign_in.dart';
import '../colors.dart';
import 'google_map.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    //Menu side list goes here
                    ListTile(
                      leading: const Icon(
                        Icons.home,
                        color: GREEN,
                      ),
                      title: const Text(
                        'Home',
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.info,
                        color: GREEN,
                      ),
                      title: const Text(
                        'About us',
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        //Direct to about  us page
                      },
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'Se deconnecter',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.logout_outlined,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: GREEN,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Google map demo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GoogleMapScreen()),
          );
        },
        tooltip: 'Google Map',
        backgroundColor: GREEN,
        child: Icon(
          Icons.pin_drop_outlined,
        ),
      ),
    );
  }
}
