import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_document/view/auth/Login.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}