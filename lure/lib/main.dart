import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Hashi',
      home: const LoginPage(),
      theme: ThemeData(
        fontFamily: 'RobotoMono',
        scaffoldBackgroundColor: Colors.white,
      ),
    ),
  );
}
