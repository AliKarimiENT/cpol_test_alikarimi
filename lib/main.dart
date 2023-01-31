import 'package:flutter/material.dart';
import 'theme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CPOL Test Project',
      theme: theme(),
      // home: ,
    );
  }


}
