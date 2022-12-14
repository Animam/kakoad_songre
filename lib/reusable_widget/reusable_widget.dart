import 'package:flutter/material.dart';

import '../colors.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

TextField reuseable_widget(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.black,
    // style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: GREEN,
      ),
      labelText: text,
      labelStyle: const TextStyle(
          // color: Colors.white.withOpacity(0.9),
          ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        // borderSide: BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

IntlPhoneField phoneField() {
  return IntlPhoneField(
    initialCountryCode: 'BF',
    onChanged: (phoneNumber) {
    },
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
  );
}

// IntlPhoneField phoneField(TextEditingController controller){
//  return IntlPhoneField(
//
//  )
// }
Container signInSignUpButton(BuildContext context, Function onPressed) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90),
    ),
    child: ElevatedButton(
      onPressed: () {
        onPressed;
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(GREEN),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      ),
      child: const Text(
        'Log In',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  );
}
