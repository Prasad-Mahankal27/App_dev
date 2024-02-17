import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Persiever'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Color getRandomColor() {
    Random random = Random();
    int red = random.nextInt(256); // Random value between 0 and 255
    int green = random.nextInt(256);
    int blue = random.nextInt(256);
    return Color.fromARGB(255, red, green, blue); // Alpha set to 255 for fully opaque color
  }

  int _counter = 1;
  int ans=5;
  void _incrementCounter() {
    setState(() {
      changeColour=getRandomColor();
      _counter++;
      ans+=5;
    });
  }

  Color changeColour=Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             InkWell(
               onTap: _incrementCounter,
               child: CircleAvatar(
                  backgroundColor: changeColour,
                maxRadius: 150,
                           ),
             ),
           const Text(" "),
            const Text(
              "Let's create a table of 5:",
            ),
            Text(
              '5 * $_counter = $ans',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Click to print power of 5', //imp
        child: const Icon(Icons.add),
      ),
    );
  }
}
