import 'package:flutter/material.dart';
import 'package:todolist/actions/home_screen.dart';
import 'package:todolist/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'To Do List',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: AppTheme.lightTheme,
    );
  }

}