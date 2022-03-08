import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(Go());
}

class Go extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Go> {
  final _form = GlobalKey<FormState>();
  late String name;
  late String mobile;
  late String bikemodel;
  late String bikeno;
  late String imageurl;



  void writeData() async {
    _form.currentState?.save();

    // Please replace the Database URL
    // which we will get in “Add Realtime
    // Database” step with DatabaseURL
    var url = "https://smart-helmet-4d276-default-rtdb.asia-southeast1.firebasedatabase.app/"+"data.json";

    // (Do not remove “data.json”,keep it as it is)
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({"name":name,"mobile":mobile,"bikemodel":bikemodel,"bikeno":bikeno,"imageurl":imageurl}),
      );
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RealTime Database',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
        ),
        body: Form(
          key: _form,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Name"),
                  onSaved: (value) {
                    name = value!;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "mobile"),
                  onSaved: (value) {
                    mobile = value!;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "model"),
                  onSaved: (value) {
                    bikemodel = value!;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "bikeno"),
                  onSaved: (value) {
                    bikeno = value!;
                  },
                ),
                SizedBox(
                  height: 10,
                ), TextFormField(
                  decoration: InputDecoration(hintText: "imageurl"),
                  onSaved: (value) {
                    imageurl = value!;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                    onPressed: writeData,
                    color: Colors.green,
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
