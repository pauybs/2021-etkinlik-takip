import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/product/widget/bottomNavigation/bottom_navigation.dart';
import 'category_view_model.dart';

class CategoryView extends CategoryViewModel {
  Color colorButton1 = Colors.indigo;
  Color colorButton2 = Colors.indigo.shade100;
  Color colorButton3 = Colors.indigo.shade100;
  Color colorButton4 = Colors.indigo.shade100;
  Color colorButton5 = Colors.indigo;
  Color colorButton6 = Colors.indigo.shade100;
  Color colorButton7 = Colors.indigo.shade100;
  Color colorButton8 = Colors.indigo.shade100;
  Color colorButton9 = Colors.indigo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(flex: 1),
            Expanded(
              flex: 1,
              child: Text(
                "İlgi Alanlarını Seç",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Ne tür etkinliklerden hoşlandığını seç ve sana",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      "özel etkinlik bildirimleri gönderlim",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorButton1,
                        ),
                        height: 50,
                        width: 50,
                        child: IconButton(
                          icon: Icon(
                            Icons.sports_basketball,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () {
                            setState(() {
                              if (colorButton1 == Colors.indigo)
                                colorButton1 = Colors.indigo.shade100;
                              else
                                colorButton1 = Colors.indigo;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Spor"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorButton2,
                        ),
                        height: 50,
                        width: 50,
                        child: IconButton(
                          icon: Icon(
                            Icons.notes_outlined,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () {
                            setState(() {
                              if (colorButton2 == Colors.indigo)
                                colorButton2 = Colors.indigo.shade100;
                              else
                                colorButton2 = Colors.indigo;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Kültür "),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 5),
                      Text("Doğa"),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 5),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorButton4,
                        ),
                        height: 50,
                        width: 50,
                        child: IconButton(
                          icon: Icon(
                            Icons.photo_camera_outlined,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () {
                            setState(() {
                              if (colorButton4 == Colors.indigo)
                                colorButton4 = Colors.indigo.shade100;
                              else
                                colorButton4 = Colors.indigo;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Tasarım"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorButton5,
                        ),
                        height: 50,
                        width: 50,
                        child: IconButton(
                          icon: Icon(
                            Icons.science_outlined,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () {
                            setState(() {
                              if (colorButton5 == Colors.indigo)
                                colorButton5 = Colors.indigo.shade100;
                              else
                                colorButton5 = Colors.indigo;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Bilim"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorButton6,
                        ),
                        height: 50,
                        width: 50,
                        child: IconButton(
                          icon: Icon(
                            Icons.mobile_friendly_outlined,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () {
                            setState(() {
                              if (colorButton6 == Colors.indigo)
                                colorButton6 = Colors.indigo.shade100;
                              else
                                colorButton6 = Colors.indigo;
                            });
                          },
                        ),
                      ),
                      Text("Teknoloji"),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 5),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorButton7,
                        ),
                        height: 50,
                        width: 50,
                        child: IconButton(
                          icon: Icon(
                            Icons.headset,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () {
                            setState(() {
                              if (colorButton7 == Colors.indigo)
                                colorButton7 = Colors.indigo.shade100;
                              else
                                colorButton7 = Colors.indigo;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Müzik"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorButton8,
                        ),
                        height: 50,
                        width: 50,
                        child: IconButton(
                          icon: Icon(
                            Icons.theater_comedy,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () {
                            setState(() {
                              if (colorButton8 == Colors.indigo)
                                colorButton8 = Colors.indigo.shade100;
                              else
                                colorButton8 = Colors.indigo;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Tiyatro"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorButton9,
                        ),
                        height: 50,
                        width: 50,
                        child: IconButton(
                          icon: Icon(
                            Icons.extension_sharp,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () {
                            setState(() {
                              if (colorButton9 == Colors.indigo)
                                colorButton9 = Colors.indigo.shade100;
                              else
                                colorButton9 = Colors.indigo;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Oyun"),
                    ],
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ),
            Spacer(flex: 1),
            RaisedButton(
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  "Giriş Yap",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavigation(),
                  ),
                );
              },
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
