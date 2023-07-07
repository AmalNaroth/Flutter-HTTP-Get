import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "https://swapi.dev/api/people";

  List<dynamic> data=[];

  @override
  void initState() {
    super.initState();
    getJsonData();
  }

  Future<String> getJsonData() async {
    // var response = await http.get(Uri.parse(url));
    // if(response.statusCode==200){
    //   final jsondata=jsonDecode(response.body);
    // }

    var response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      // print(response.body);
      final jsondata=jsonDecode(response.body);
      setState(() {
        data=jsondata['results'];
      });
    } else {
      print("Respose not get");
    }
    return "success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: data==null ? 0 : data.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data[index]['name']),
                        Text(data[index]['height']),
                        Text(data[index]['mass']),
                        Text(data[index]['hair_color']),
                        Text(data[index]['skin_color']),
                         Text(data[index]['eye_color']),
                          Text(data[index]['birth_year']),
                           Text(data[index]['gender']),
                      ],
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
