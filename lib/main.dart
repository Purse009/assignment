import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riverpod_flutter/login/login_controller.dart';
import 'package:riverpod_flutter/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return LoginController();
      },
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LoginPage(),
        );
      },
    );
  }
}
