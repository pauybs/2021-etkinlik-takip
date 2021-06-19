import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermvvmtemplate/view/sign_in/view/sign_in_view.dart';
import 'package:fluttermvvmtemplate/view/sign_up/view/sign_up_view.dart';

class OnBoardingPage extends StatefulWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  List<Map<String, String>> splashData = [
    {
      "header": "Your thoughts. ",
      "colorHeader": "Clanner",
      "color": "Colors.blue",
      "desc": "Bring clarity to your thougths",
      "photo": "asset/svg/onBoard3.svg"
    },
    {
      "header": "Your thoughts. ",
      "colorHeader": "Clanner",
      "color": "Colors.blue",
      "desc": "Bring clarity to your thougths",
      "photo": "asset/svg/onBoard4.svg"
    },
    {
      "header": "Your thoughts. ",
      "colorHeader": "Clanner",
      "color": "Colors.blue",
      "desc": "Bring clarity to your thougths",
      "photo": "asset/svg/onBoard1.svg"
    },
    {
      "header": "Your thoughts. ",
      "colorHeader": "Clanner",
      "color": "Colors.blue",
      "desc": "Bring clarity to your thougths",
      "photo": "asset/svg/onBoard2.svg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                color: Colors.white10.withOpacity(0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(flex: 1),
                    Expanded(
                      flex: 10,
                      child: splashScreenLists(),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Spacer(flex: 3),
                          Expanded(
                            flex: 3,
                            child: login(),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 3,
                            child: signUp(),
                          ),
                          Spacer(flex: 2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container splashScreenLists() {
    return Container(
      child: PageView.builder(
        itemCount: splashData.length,
        itemBuilder: (context, index) => OnboardingSliderCard(
          header: splashData[index]["header"],
          desc: splashData[index]["desc"],
          photo: splashData[index]["photo"],
          colorHeader: splashData[index]["colorHeader"],
        ),
      ),
    );
  }

  RaisedButton login() {
    return RaisedButton(
      onPressed: () {
        loginOnPressed();
      },
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: text("Login", Colors.white),
      ),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(80.0))),
    );
  }

  void loginOnPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  GestureDetector signUp() {
    return GestureDetector(
      onTap: () {
        sigUpOnTap();
      },
      child: text("Sign Up", Colors.black),
    );
  }

  void sigUpOnTap() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => SignUp()));

  Text text(String text, Color color) =>
      Text(text, style: TextStyle(color: color, fontSize: 22));
}

class OnboardingSliderCard extends StatelessWidget {
  final String? header;
  final String? colorHeader;
  final String? desc;
  final String? photo;
  final String? index;
  final String? color;
  const OnboardingSliderCard(
      {Key? key,
      this.header,
      this.desc,
      this.photo,
      this.index,
      this.colorHeader,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textSliderCard(header!, fontSize: 26),
                textSliderCard(colorHeader!,
                    fontSize: 26, fontWeight: FontWeight.bold),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: textSliderCard(desc!, fontSize: 18),
          ),
          Expanded(
            flex: 10,
            child: SvgPicture.asset("${photo.toString()}"),
          ),
        ],
      ),
    );
  }

  Text textSliderCard(String text, {double? fontSize, FontWeight? fontWeight}) {
    return Text(text,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight));
  }
}
