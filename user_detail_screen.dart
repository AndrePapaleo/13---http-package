import 'package:flutter/material.dart';
import 'user_model.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${user.name}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Username: ${user.username}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Email: ${user.email}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Cidade: ${user.address.city}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Empresa: ${user.company.name}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
