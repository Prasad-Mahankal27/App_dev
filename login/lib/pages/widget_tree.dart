import 'package:login/pages/auth.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/pages/login_register_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else if (snapshot.hasError) {
          // Handle errors gracefully, e.g., display an error message
          return const Center(child: Text('Authentication failed'));
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
