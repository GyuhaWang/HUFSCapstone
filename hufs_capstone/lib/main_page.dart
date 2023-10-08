import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  double pageHorizontalPadding = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HUFS CAPSTONE")),
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: pageHorizontalPadding),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [ImageWidget(), petInfo(), status()],
              ),
            ),
          )),
    );
  }

  Widget ImageWidget() {
    return Container(
      color: Colors.amber,
      width: double.infinity,
      height: 300,
      child: Center(
        child: Text('Image'),
      ),
    );
  }

  Widget petInfo() {
    return Container(
      color: Colors.blueAccent,
      width: double.infinity,
      height: 300,
      child: Center(
        child: Text('Pet Info'),
      ),
    );
  }

  Widget status() {
    return Container(
      color: Colors.redAccent,
      width: double.infinity,
      height: 300,
      child: Center(
        child: Text('status'),
      ),
    );
  }
}
