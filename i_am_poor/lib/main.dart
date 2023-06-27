import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'I am poor',
      home: Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          title: Text('I am poor :('),
          backgroundColor: Colors.blue.shade500,
        ),
        body: Center(
            child: Image.asset('Images/trash.png', height: 300,)
        ),
      ),

    ),
  );
}