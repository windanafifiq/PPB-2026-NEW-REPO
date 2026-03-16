import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('my first app'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Hello Ninjas!')
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('click'),
        onPressed: () {},
      ),
    ),
));