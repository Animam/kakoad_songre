// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kakoad_songre/screens/sign_in.dart';
import '../colors.dart';
import 'google_map.dart';
import'package:intl_phone_field/intl_phone_field.dart';

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
              headerWidget(),
              SizedBox(height: 20),
              const Divider(thickness: 1, height: 10, color: Colors.grey),
              SizedBox(height: 20),
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
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: GREEN, primary: Colors.white),
              child: Text(
                'Voir les sols',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GoogleMapScreen()),
                );
              },
            ),
            SizedBox(height: 25),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: GREEN, primary: Colors.white),
              child: Text(
                'Voir fiche technique',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget headerWidget() {
    const image = 'images/profile.jpeg';
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 40, 0, 24),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(image),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Anicet SEDOGO',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'anicetsedogo@gmail.com',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
