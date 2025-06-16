import 'package:flutter/material.dart';
import 'user_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo HTTP Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UsersListScreen(),
    );
  }
}
