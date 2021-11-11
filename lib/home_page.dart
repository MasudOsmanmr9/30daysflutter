import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 40;

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog App'),
      ),
      body: Center(
        child: Container(
          child: Text('hellow flutter $days'),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
