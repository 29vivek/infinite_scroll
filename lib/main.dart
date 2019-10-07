import 'package:flutter/material.dart';
import 'package:inf_scroll/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinite Scroll',
      home: HomeView(),
    );
  }
}