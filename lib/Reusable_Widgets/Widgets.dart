// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'colors.dart';

class ReusableWidgets {
  Widget Logo() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 40, bottom: 20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Image(
              image: AssetImage(
                "assets/wolf.png",
              ),
              height: 50),
          const SizedBox(
            width: 5,
          ),
          GradientText("Wolf",
              style: GoogleFonts.mochiyPopOne(
                  fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1),
              colors: const [purplePinkColor, purplePinkColor]),
        ],
      ),
    );
  }

  Widget TextFieldContainer({
    required hintText,
    required IconData icon,
    String? Function(String?)? validate,
    required bool value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 120, right: 120),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: softPinkColor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          shape: BoxShape.rectangle,
        ),
        child: Center(
          child: TextFormField(
            obscureText: value,
            validator: validate,
            style: const TextStyle(
                color: liteBlack, fontSize: 25, fontWeight: FontWeight.w600),
            cursorColor: loginColor,
            cursorWidth: 1.5,
            // cursorHeight: 30,
            decoration: InputDecoration(
              icon: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(
                  icon,
                  size: 30,
                  color: liteBlack,
                ),
              ),
              hintStyle: const TextStyle(
                  fontSize: 20,
                  color: fontGraycolor,
                  textBaseline: TextBaseline.alphabetic),
              hintText: hintText,

              border: InputBorder.none,
              // contentPadding: EdgeInsets.all(17),
            ),
          ),
        ),
      ),
    );
  }

  Widget LoginButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 120, right: 120),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: purpleColor,
          // color: loginColor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          shape: BoxShape.rectangle,
        ),
        child: Center(
          child: Text("Login",
              style: GoogleFonts.notoSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: loginColor)),
        ),
      ),
    );
  }

  Widget UserContainer({
    required String profile,
    required String name,
    required String email,
  }) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: softPinkColor),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: CircleAvatar(
              backgroundImage: NetworkImage(profile),
              maxRadius: 35,
              onBackgroundImageError: (exception, stackTrace) => "Ok",
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.dmSans(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                email,
                style: GoogleFonts.dmSans(fontSize: 15, color: fontGraycolor),
              ),
            ],
          )
        ],
      ),
    );
  }

// =======Pin Me Button========
  Widget PingMeButton() {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: purpleColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        shape: BoxShape.rectangle,
      ),
      child: Center(
        child: Text("Ping Me",
            style: GoogleFonts.dmSans(
                fontSize: 20, fontWeight: FontWeight.bold, color: loginColor)),
      ),
    );
  }

  // ======== Deta

  Widget DetailContainer(
      {required String name, required String mailId, required String url}) {
    return Container(
      height: 620,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: softPinkColor),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: CircleAvatar(
              backgroundImage: NetworkImage(url),
              radius: 80,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            name,
            style:
                GoogleFonts.dmSans(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            mailId,
            style: GoogleFonts.dmSans(fontSize: 20, color: fontGraycolor),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Text(
                  "         Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore etnulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  style: GoogleFonts.dmSans(fontSize: 20, color: fontGraycolor),
                ),
                const SizedBox(
                  height: 50,
                ),
                PingMeButton()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
