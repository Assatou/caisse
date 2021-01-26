import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class produit extends StatefulWidget {
  @override
  _produitState createState() => _produitState();
}

class _produitState extends State<produit> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Future getData() async {
    var url = 'bad-event.com/caisse/produit.php';
    var response = http.get(url);
    return json.encode(response.body);
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
