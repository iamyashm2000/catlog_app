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
      theme: ThemeData(textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black))),
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom:  TabBar(
            isScrollable: false,
              tabs: [
                Tab(child: Text('Handbag',style: TextStyle(color: Colors.black),),),
                Tab(child: Text('Jwellery',style: TextStyle(color: Colors.black),),),
                Tab(child: Text('FootWear',style: TextStyle(color: Colors.black),),),
                Tab(child: Text('Dresses',style: TextStyle(color: Colors.black),),),
              ],
            ),
          elevation: 0,
          textTheme: TextTheme(title: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 40)),
          title: Text('Catlog App'),
          backgroundColor: Colors.white,
          actions: [
          IconButton(icon: Icon(Icons.search,color: Colors.black,), onPressed: (){}),
          IconButton(icon: Icon(Icons.shopping_cart,color: Colors.black,), onPressed: (){})
        ],),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),title: Text('HandBag')),
          BottomNavigationBarItem(icon: Icon(Icons.pets),title: Text('FootWear')),

        ],),
        body: TabBarView(
          children: [
            Container(child: Text('Handbag',textAlign: TextAlign.center,)),
            Text('Jwellery'),
            Text('Footwear'),
            Text('Dresses'),
          ],
        ),
      ),
    );
  }
}
