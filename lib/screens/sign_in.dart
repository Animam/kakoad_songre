import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakoad_songre/main.dart';
import 'package:kakoad_songre/reusable_widget/reusable_widget.dart';
import 'package:kakoad_songre/screens/sign_up.dart';

import 'home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController usernameControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sign In',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 30,),
              reuseable_widget('Utilisateur', Icons.person_outline, false,
                  usernameControler),
              const SizedBox(height: 30),
              reuseable_widget(
                  'Mot de passe', Icons.lock, true, passwordControler),
              const SizedBox(height: 30,),
              signInSignUpButton(context, true, () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }),
              signUpOption()
            ],
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have account ?',
          style: TextStyle(color: Colors.black),),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpPage()),);
          },
          child: const Text('sign up',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
          ),),
        )
      ],
    );
  }
}