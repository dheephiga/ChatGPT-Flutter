import 'dart:convert';

// import 'package:app/function.dart';
import 'package:flutter/material.dart';

import 'function.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = '';
  var data;
  String output = 'Initial Output';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ASCII')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              onChanged: (value) {
                url = 'http://127.0.0.1:5000/api?query=' + value.toString();
              },
            ),
            TextButton(
                onPressed: () async {
                  data = await fetchdata(url);
                  var decoded =  await jsonDecode(data);
                  setState(() {
                    output = decoded['output'];
                  });
                },
                child: Text(
                  'Get answer',
                  style: TextStyle(fontSize: 20),
                )),
            Text(
              output,
              style: TextStyle(fontSize: 12, color: Colors.green),
            )
          ]),
        ),
      ),
    );
  }
}