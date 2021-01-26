import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  TextEditingController nom = new TextEditingController();
  TextEditingController quantite = new TextEditingController();
  TextEditingController prix = new TextEditingController();
  String qrCodeResult = "";

  Future<List> senddata() async {
    var response = await http.post("bad-event.com/caisse/produit.php", body: {
      "idqrcode": qrCodeResult,
      "nom": nom.text,
      "quantite": quantite.text,
      "prix": prix.text,
    });
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              qrCodeResult,
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              onPressed: () async {
                String codeScanner =
                    await BarcodeScanner.scan(); //barcode scanner
                setState(() {
                  qrCodeResult = codeScanner;
                });

                SizedBox(
                  height: 20,
                );
              },
              child: Text(
                "Scanner",
                style: TextStyle(
                    color: Colors.lightGreen, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.yellow, width: 3.0),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              onPressed: () async {
                setState(() {
                  senddata();
                });

                SizedBox(
                  height: 20,
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: nom,
              decoration: InputDecoration(
                  labelText: 'Nom produit', border: OutlineInputBorder()),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: quantite,
              decoration: InputDecoration(
                  labelText: 'Quantité ', border: OutlineInputBorder()),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: prix,
              decoration: InputDecoration(
                  labelText: 'Prix', border: OutlineInputBorder()),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () {},
              child: Text(
                'Envoyer',
                style: TextStyle(
                    color: Colors.lightGreen, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.yellow, width: 3.0),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ],
        ),
      ),
    );
  }
}
