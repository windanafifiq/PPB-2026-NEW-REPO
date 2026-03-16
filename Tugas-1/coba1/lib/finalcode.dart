import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('...'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Text(
          'Henshin',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            color: Colors.blueAccent,
            fontFamily: 'IndieFlower',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Text('click'),
        onPressed: () {},
      ),
    ),
));