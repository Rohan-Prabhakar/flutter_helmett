import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(read());
}

class read extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<read> {
  void initState() {
    super.initState();
    readData();
  }

  bool isLoading = true;
  List<String> list = [];

  Future<void> readData() async {

    // Please replace the Database URL
    // which we will get in “Add Realtime Database”
    // step with DatabaseURL

    var url = "https://smart-helmet-4d276-default-rtdb.asia-southeast1.firebasedatabase.app/"+"data.json";
    // Do not remove “data.json”,keep it as it is
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((blogId, blogData) {
        list.add(blogData["name"]);
        list.add(blogData["mobile"]);
        list.add(blogData["bikemodel"]);
        list.add(blogData["bikeno"]);
        list.add(blogData["imageurl"]);

      });
      setState(() {
        isLoading = false;
      });
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
            title: Text("GeeksforGeeks"),
          ),
          body: isLoading
              ? CircularProgressIndicator()
              : ListView(
    children: [
      Text("${list[0]}"),      Text("${list[1]}"),
    Text("${list[2]}"),
    Text("${list[3]}"), Image.network(list[4]),

    ],
              ),),
    );
  }
}
