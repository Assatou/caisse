import 'package:flutter/material.dart';

class form extends StatefulWidget {
  @override
  _formState createState() => _formState();
}

class _formState extends State<form> {
  TextEditingController idqrcodectrl, namectrl, quantitectrl, prixctrl;

  bool processing = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idqrcodectrl = new TextEditingController();
    namectrl = new TextEditingController();
    quantitectrl = new TextEditingController();
    prixctrl = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset('assets/caisse.png', height: 200.0, width: 200.0),
                Container(
                  child: Text('Ajouter des produits',
                      style: Theme.of(context).textTheme.title),
                ),
                SizedBox(height: 25.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'idqrcode', border: OutlineInputBorder()),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Nom produit', border: OutlineInputBorder()),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Quantité ', border: OutlineInputBorder()),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Prix du produit',
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: 10.0),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Envoyer'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
