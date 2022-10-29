import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;

class Result extends StatelessWidget {
  Result({Key? key, required this.price, required this.data}) : super(key: key);
  final double price;
  var data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Result'),
      ),
      body: Center(
        child: Center(
            child: Column(children: [
          QrImage(
            data: data.toString(),
            version: QrVersions.auto,
            size: 120,
            gapless: false,
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              width: 400,
              height: 200,
              child: Card(
                  child: Center(
                child: Text(
                    "The Predicted Price is: \n${price.toInt().toString()} DA",
                    style:
                        GoogleFonts.poppins(fontSize: 24, color: Colors.black)),
              ))),
        ])),
      ),
    );
  }

  _callQr(Map<String, String> data) async {
    var url = 'https://lasso-app.herokuapp.com/estimate';
    var body = json.encode(data);

    final response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    final result = jsonDecode(response.body);
    final newResult = jsonDecode(result["The predicted price is"]);
    return newResult[0];
  }
}
