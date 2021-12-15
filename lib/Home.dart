import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
 _HomeState createState() => _HomeState();
}

 class _HomeState extends State<Home> {
  @override


 void _valorBitcoin() async {
    String url = "https://blockchain.info/ticker";
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = jsonDecode((response.body));
    setState(() {
      String _value = retorno ["BRL"]["buy"].toString();
    });
    print("Resultado : " + retorno ["BRL"]["buy"].toString() );

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset("image/bitcoin.png"),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
              ),
              Text(
                "R\$" +_value,
                style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                ),
              ),
            ElevatedButton(
              child: Text(
                "Atualizar",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              onPressed: _valorBitcoin,
            ),
          ],
          ),
        ),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}