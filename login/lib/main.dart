import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login/pages/widget_tree.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform); // Use your options, not DefaultFirebaseOptions
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "User Login",
      theme: ThemeData(
       // colorScheme:  ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        primarySwatch: Colors.blue,
      //  useMaterial3: true,
      ),
      home: const WidgetTree(),
      debugShowCheckedModeBanner: false,
    );
  }
}






