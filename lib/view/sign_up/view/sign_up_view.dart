import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermvvmtemplate/view/category_select/category.dart';
import 'package:fluttermvvmtemplate/view/category_select/category_view.dart';
import 'package:fluttermvvmtemplate/view/select_profile_photo/select_photo.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? adSoyad, kullaniciAdi, emailAdress, sifre, sifreTekrar, telefonNo;
  bool autoControl = false;
  // TEXT
  String registerText = "Kayıt Ol";
  String topText1 = "Sadece 2 dakikanı ayırarak Mappindo";
  String topText2 = "hesabı oluştur ve güncel etkinlikleri takip et";
  //--
  String nameText = "Ad";
  String userText = "Kullanıcı";
  String userNameText = "Kullanıcı Adı";
  String nameAndSurnameText = "Ad Soyad";
  String emailText = "Email";
  String passwordText = "Şifre";
  String againPasswordText = "Şifre Tekrarı";
  String phoneText = "Telefon";
  String phoneNumberText = "Telefon Numaranız";

  // URL
  String registerTopUrl = "asset/svg/registerTop.svg";

  // SHAPE
  OutlineInputBorder shape =
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(80.0)));

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: formKey,
            autovalidate: autoControl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.92,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: text(registerText,
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      //Text(registerText,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))),
                      Expanded(
                        flex: 8,
                        child: SvgPicture.asset(registerTopUrl),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Expanded(child: text(topText1, fontSize: 14)),
                            Expanded(child: text(topText2, fontSize: 14)),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 20,
                        child: formColum(),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: registirButton(),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text text(String textValue,
          {Color? color, double? fontSize, FontWeight? fontWeight}) =>
      Text(textValue,
          style: TextStyle(
              color: color, fontSize: fontSize, fontWeight: fontWeight));

  TextFormField formField(String hintText, String labelText,
      TextInputType inputType, bool obsureText, validatorFunc) {
    int? maxLength;
    if (hintText == phoneText) {
      maxLength = 11;
    } else
      maxLength = null;

    return TextFormField(
        obscureText: obsureText, // şifre görünmezliği
        keyboardType: inputType,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 12),
          hintStyle: TextStyle(fontSize: 12),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          errorBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        ),
        validator: validatorFunc,
        maxLength: maxLength,
        onSaved: (value) {
          if (hintText == nameText) adSoyad = value;
          if (hintText == emailText) emailAdress = value;
          if (hintText == userText) kullaniciAdi = value;
          if (hintText == passwordText) sifre = value;
          if (labelText == againPasswordText) sifreTekrar = value;
          if (hintText == phoneText) telefonNo = value;
        });
  }

  Column formColum() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: formField(nameText, nameAndSurnameText, TextInputType.name,
              false, _isimKontrol),
        ),
        Expanded(
          flex: 1,
          child: formField(
              userText, userNameText, TextInputType.name, false, _isimKontrol),
        ),
        Expanded(
            flex: 1,
            child: formField(emailText, emailText, TextInputType.emailAddress,
                false, _emailKontrol)),
        Expanded(
            flex: 1,
            child: formField(passwordText, passwordText,
                TextInputType.visiblePassword, true, _sifreControl)),
        Expanded(
            flex: 1,
            child: formField(passwordText, againPasswordText,
                TextInputType.visiblePassword, true, _sifreControl)),
        Expanded(
            flex: 2,
            child: formField(phoneText, phoneNumberText, TextInputType.phone,
                false, _phoneControl)),
      ],
    );
  }

  RaisedButton registirButton() {
    return RaisedButton(
      onPressed: () {
        registerOnPressed();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: text(registerText, color: Colors.white, fontSize: 22),
      ),
      color: Colors.black,
      shape: shape,
    );
  }

  void registerOnPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SelectPhoto()));
    } else {
      setState(() {
        autoControl = true;
      });
    }
  }

  // CONTROLS
  String? _emailKontrol(String mail) {
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = new RegExp(pattern as String);
    if (!regex.hasMatch(mail))
      return "Geçersiz mail adresi";
    else
      return null;
  }

  String? _isimKontrol(String name) {
    if (name.length < 3)
      return "En az 3 harf olmalıdır";
    else
      return null;
  }

  String? _phoneControl(String phone) {
    if (phone.length < 11)
      return "Telefon numarası hatalı";
    else
      return null;
  }

  String? _sifreControl(String sifre) {
    if (sifre.length < 8)
      return "Sifreniz en az 8 karakter olmalıdır";
    else
      return null;
  }

  String? _sifreTekrarControl(String sifreTekrari) {
    if (sifre != sifreTekrar)
      return "hata";
    else
      return null;
  }
}
