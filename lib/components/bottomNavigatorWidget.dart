// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobile_document/view/home/home.dart';

class BottomNavigatorWidget extends StatefulWidget {
  const BottomNavigatorWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorWidget> createState() => _BottomNavigatorWidgetState();
}

class _BottomNavigatorWidgetState extends State<BottomNavigatorWidget> {
  int _currenwidget = 0;
  List<Widget> _children = [
    HomeView(), // 0
    Container(height: 500, color: Colors.red),
    Container(height: 500, color: Colors.green),
  ];
  void _onTap(int index) {
    setState(() {
      _currenwidget = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currenwidget],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.indigo,
        selectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currenwidget,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "ໜ້າຫຼັກ"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "ປະຫວັດ"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "ໂປຣໄຟ"),
        ],
      ),
    );
  }
}
