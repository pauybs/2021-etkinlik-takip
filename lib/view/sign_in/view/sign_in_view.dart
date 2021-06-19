import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermvvmtemplate/product/widget/bottomNavigation/bottom_navigation.dart';
import 'package:fluttermvvmtemplate/view/sign_up/view/sign_up_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool autoControl = false;
  // PATTERN
  Pattern pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  //
  String? _sifre, _email;
  //
  String textSifre = "Şifre";
  String textEmail = "Email";
  String login = "Giriş Yap";
  String forgetPassword = "Şifremi Unuttum ?";
  String register = "Kayıt Ol";
  String bottomText = "Eğer mevcut bir hesabın yoksa ";
  // IMAGE URLS
  String loginSvgUrl = "asset/svg/signIn.svg";

  IconData googleIcon = MaterialCommunityIcons.google;
  IconData twitterIcon = MaterialCommunityIcons.twitter;
  // LOGO URL googleLogoSvg
  String logo1 = "asset/svg/googleLogo.svg";
  // ERROR
  String errorEmail = "Geçersiz mail adresi";
  String errorSifre = "Şifre zorunludur";
  // SHAPE
  OutlineInputBorder shape =
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(80)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          autovalidate: autoControl,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 2,
                  child: text(login, color: Colors.black, fontSize: 26),
                ),
                Expanded(
                  flex: 9,
                  child: svg(),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: formField(textEmail, textEmail,
                            TextInputType.emailAddress, false, _emailKontrol),
                      ),
                      Expanded(
                        flex: 2,
                        child: formField(textSifre, textSifre,
                            TextInputType.visiblePassword, true, _sifreKontrol),
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 1),
                Expanded(
                  flex: 1,
                  child: tarz(),
                ),
                Expanded(
                  flex: 4,
                  child: googleAndTwitter(),
                ),
                Expanded(
                  flex: 3,
                  child: loginButton(),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Spacer(flex: 1),
                      Expanded(
                        child: forgetPasword(),
                      ),
                      Expanded(
                        child: textBottom(),
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text text(String text, {Color? color, double? fontSize}) {
    return Text(text,
        style: TextStyle(
            color: color, fontWeight: FontWeight.bold, fontSize: fontSize));
  }

  SvgPicture svg() => SvgPicture.asset(loginSvgUrl);

  TextFormField formField(String hintText, String labelText,
      TextInputType inputType, bool obsureText, Function validatorFunc) {
    return TextFormField(
      obscureText: obsureText, // şifre görünmezliği
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: TextStyle(fontSize: 12),
        labelStyle: TextStyle(fontSize: 12),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        errorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      ),
      validator: validatorFunc as String? Function(String?)?,
      onSaved: (value) {
        if (hintText == textEmail) _email = value;
        if (hintText == textSifre) _sifre = value;
      },
    );
  }

  Row tarz() {
    return Row(
      children: [
        Expanded(child: buildDivider()),
        Text(
          "ya da",
          style: TextStyle(fontSize: 13),
        ),
        Expanded(child: buildDivider()),
      ],
    );
  }

  Divider buildDivider() {
    return Divider(
      thickness: 1,
      color: Colors.grey,
      indent: MediaQuery.of(context).size.width * 0.04,
      endIndent: MediaQuery.of(context).size.width * 0.04,
    );
  }

  Row googleAndTwitter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        logoButton(googleIcon),
        logoButton(twitterIcon),
      ],
    );
  }

  RaisedButton logoButton(IconData icon) {
    return RaisedButton(
      elevation: 15,
      color: Colors.white,
      onPressed: () {},
      child: ClipOval(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            icon,
            size: 40,
          ),
        ),
      ),
      shape: CircleBorder(),
    );
  }

  RaisedButton loginButton() {
    return RaisedButton(
      onPressed: () {
        loginOnPressed();
      },
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: text(login, color: Colors.white, fontSize: 22),
      ),
      shape: shape,
    );
  }

  TextButton sifreUnuttum() {
    return TextButton(
      onPressed: () {},
      child: GestureDetector(
        onTap: () {
          print('gesture dedector calisti');
        },
        child: Text(
          "Şifremi Unuttum ?",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
  void loginOnPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    } else {
      setState(() {
        autoControl = true;
      });
    }
  }

  GestureDetector forgetPasword() =>
      GestureDetector(child: text2(forgetPassword, fontSize: 12));

  Row textBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text2(bottomText, fontSize: 12),
        GestureDetector(
          onTap: () {},
          child: text2(register, color: Colors.blue, fontSize: 12),
        ),
      ],
    );
  }

  Text text2(String text, {Color? color, double? fontSize}) =>
      Text(text, style: TextStyle(fontSize: fontSize, color: color));

//kontroller
  String? _emailKontrol(String mail) {
    RegExp regex = new RegExp(pattern as String);
    if (!regex.hasMatch(mail))
      return errorEmail;
    else
      return null;
  }

  String? _sifreKontrol(String sifre) {
    if (sifre == "")
      return errorSifre;
    else
      return null;
  }
}
