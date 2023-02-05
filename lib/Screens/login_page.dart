// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ravan/Reusable_Widgets/Widgets.dart';
import 'package:ravan/Screens/home_page.dart';
import '../Reusable_Widgets/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _ValidateKey = GlobalKey<FormState>();
    final screenSize = MediaQuery.of(context).size;
    final reuse = ReusableWidgets();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // reuse.Logo(),
            SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70, bottom: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Image(
                      image: AssetImage("assets/LoginVector.png"),
                      height: 570,
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 50, top: 150),
                    child: Column(
                      children: [
                        Text(
                          "User Login",
                          style: GoogleFonts.notoSans(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: loginColor),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // Email Text Field
                        Form(
                          key: _ValidateKey,
                          child: Column(
                            children: [
                              reuse.TextFieldContainer(
                                  value: false,
                                  // validate: validateEmail,
                                  hintText: "Email Id",
                                  icon: Icons.mail),
                              SizedBox(
                                height: 32,
                              ),
                              // Password Text Field
                              reuse.TextFieldContainer(
                                  value: true,
                                  // validate: validatePossword,
                                  hintText: "Password",
                                  icon: Icons.lock),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 32,
                        ),
                        // Login Button
                        GestureDetector(
                            onTap: () {
                              if (_ValidateKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                                print("Login Successfull");
                              } else {
                                print("Login Failure");
                              }
                            },
                            child: reuse.LoginButton()),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Forget Password?",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              textBaseline: TextBaseline.alphabetic,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
