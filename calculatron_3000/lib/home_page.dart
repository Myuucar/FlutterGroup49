import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HesapMakinesi extends StatefulWidget {
  @override
  _HesapMakinesiState createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
  final TextEditingController t1 = new TextEditingController(text: "0");
  final TextEditingController t2 = new TextEditingController(text: "0");

  var sayi1 = 0, sayi2 = 0, sonuc = 0;
  void topla() {
    setState(() {
      sayi1 = int.parse(t1.text);
      sayi2 = int.parse(t2.text);
      sonuc = sayi1 + sayi2;
    });
  }

  void cikar() {
    setState(() {
      sayi1 = int.parse(t1.text);
      sayi2 = int.parse(t2.text);
      sonuc = sayi1 - sayi2;
    });
  }

  void carp() {
    setState(() {
      sayi1 = int.parse(t1.text);
      sayi2 = int.parse(t2.text);
      sonuc = sayi1 * sayi2;
    });
  }

  void bol() {
    setState(() {
      sayi1 = int.parse(t1.text);
      sayi2 = int.parse(t2.text);
      sonuc = (sayi1 / sayi2) as int;
    });
  }

  void temizle() {
    setState(() {
      t1.text = "0";
      t2.text = "0";
      sonuc = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var FontAwesomeIcons;
    return Scaffold(

      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Hesap Makinesi"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "Sonuç: $sonuc",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,

              decoration: InputDecoration(hintText: t1.text, hintStyle: TextStyle(color: Colors.white),),
              controller: t1,
            ),
            TextField(

              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: t2.text, hintStyle: TextStyle(color: Colors.white),),
              controller: t2,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: Icon(FontAwesomeIcons.plus, color: Colors.white,),
                  onPressed: topla,
                  color: Colors.grey,
                ),
                new MaterialButton(
                  child: Icon(FontAwesomeIcons.minus, color: Colors.white,),
                  onPressed: cikar,
                  color: Colors.grey,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: Icon(FontAwesomeIcons.divide, color: Colors.white,),
                  onPressed: bol,
                  color: Colors.grey,
                ),
                new MaterialButton(
                  child: Icon(FontAwesomeIcons.times, color: Colors.white,),
                  onPressed: carp,
                  color: Colors.grey,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.grey,
                  child: Text(
                    "Temizle",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: temizle,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}