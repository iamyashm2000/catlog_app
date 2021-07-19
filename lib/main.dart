import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(CatlogApp());
}

class CatlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var res;

  var data;

  bool isDataFetched = false;

  @override
  void initState() { 
    super.initState();
    getData();
  }

  getData() async {
    res = await http.get(Uri.parse('https://api.npoint.io/3f6412251547c6ac33bd'));
    data = jsonDecode(res.body);
    print(data);
    setState(() {
          isDataFetched = true;
        });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Yash'),),
      body: isDataFetched ? GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3
        ),
        itemCount: data.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListTile(
              leading: Image.network(data[index]["url"]),
            ),
          );
        },
      ) : Center(child: CircularProgressIndicator())
    );
  }
}
