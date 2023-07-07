import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String url="https://swapi.dev/api/people";

  Future<String> getName() async{
    var response = await jso
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Card(child: Container(
              child: Text("HFJi"),
              padding: EdgeInsets.all(20),
            ),)
          ],),
        );
      },),
    );
  }
}