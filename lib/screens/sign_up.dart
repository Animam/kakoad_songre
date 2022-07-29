import 'package:flutter/material.dart';
import 'package:kakoad_songre/reusable_widget/reusable_widget.dart';
import 'package:kakoad_songre/screens/sign_in.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameControler = TextEditingController();
  TextEditingController phoneControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                    },
                    icon: Icon(Icons.arrow_back),
                  )
                ],
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 30,),
                          reuseable_widget('Utilisateur', Icons.person, false, usernameControler),
                          const SizedBox(
                            height: 30,
                          ),
                          reuseable_widget("Enter phone num", Icons.call, false,
                              phoneControler),
                          const SizedBox(
                            height: 30,
                          ),
                          reuseable_widget("Enter Password", Icons.lock, true,
                              passwordControler),
                          const SizedBox(
                            height: 30,
                          ),
                          signInSignUpButton(context, false, (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                          })
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
