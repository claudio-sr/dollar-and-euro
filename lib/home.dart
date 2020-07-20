import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const url = "https://api.hgbrasil.com/finance";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double dollarBuy;
  String dollarName;
  double dollarSell;
  double dollarVari;

  double euroBuy;
  String euroName;
  double euroSell;
  double euroVari;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("\$ Dollar and Euro \$"),
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          } else {
            dollarBuy = snapshot.data["results"]["currencies"]["USD"]["buy"];
            dollarName = snapshot.data["results"]["currencies"]["USD"]["name"];
            dollarSell = snapshot.data["results"]["currencies"]["USD"]["sell"];
            dollarVari =
                snapshot.data["results"]["currencies"]["USD"]["variation"];

            euroBuy = snapshot.data["results"]["currencies"]["EUR"]["buy"];
            euroName = snapshot.data["results"]["currencies"]["EUR"]["name"];
            euroSell = snapshot.data["results"]["currencies"]["EUR"]["sell"];
            euroVari =
                snapshot.data["results"]["currencies"]["EUR"]["variation"];

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                      width: 350,
                      height: 200,
                      color: Colors.green,
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              dollarName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            "Buy: ${dollarBuy.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Sell: ${dollarSell.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Variation: ${dollarVari.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                      width: 350,
                      height: 200,
                      color: Colors.green,
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              euroName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            "Buy: ${euroBuy.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Sell: ${euroSell.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Variation: ${euroVari.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Future<Map> getData() async {
    var response = await http.get(url);
    return json.decode(response.body);
  }
}
