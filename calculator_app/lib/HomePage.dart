//import 'dart:ffi';

import 'package:calculator_app/button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

var num1=0, num2=0, sum=0;
final TextEditingController t1 = TextEditingController(text: "");
final TextEditingController t2 = TextEditingController(text: "");
void add(){
  setState(() {
    num1=int.parse(t1.text);
    num2=int.parse(t2.text);
    sum=num1+num2;
  });
}
void sub(){
  setState(() {
    num1=int.parse(t1.text);
    num2=int.parse(t2.text);
    sum=num1-num2;
  });
}
void mul(){
  setState(() {
    num1=int.parse(t1.text);
    num2=int.parse(t2.text);
    sum=num1*num2;
  });
}
void div(){
  setState(() {
    num1=int.parse(t1.text);
    num2=int.parse(t2.text);
    sum= (num1 ~/num2);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Calculator", style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.blueAccent,
      ),
      body:
       Stack(
        fit: StackFit.expand,
        children: <Widget>[
           Image.network(
            "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_1080,q_100,w_1080/v1/gcs/platform-data-goog/events/flutter_0G48Si8.png",
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ), 
         SingleChildScrollView(
           child: Form(
             child: Theme(
              data: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: const InputDecorationTheme(
                    labelStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 20.0,
                    )
                  )
                ),
               child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network("https://i.pinimg.com/736x/6c/2d/40/6c2d40e51b303afa827ba31f73b48223.jpg", height: 250, width: 250),
                    const Padding(padding: EdgeInsets.all(10.0)),
                     TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Enter Number 1"
                      ),
                      controller: t1,
                     ),
                     TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Enter Number 2"
                      ),
                      controller: t2,
                     ),
                   const Padding(padding: EdgeInsets.only(top: 20.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(onPressed: () {
                          add();
                        },
                        color: Colors.transparent,
                        elevation: 0,
                        child: const Button(buttonText: "ADD"),
                        ),
                        MaterialButton(onPressed: () {
                          sub();
                        },
                        color: Colors.transparent,
                        elevation: 0,
                        child: const Button(buttonText: "SUBTRACT",),
                        ),  
                     ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(onPressed: () {
                          mul();
                        },
                        color: Colors.transparent,
                        elevation: 0,
                        child: const Button(buttonText: "MULTIPLY",),
                        ),
                        MaterialButton(onPressed: () {
                          div();
                        },
                        color: Colors.transparent,
                        elevation: 0,
                        child: const Button(buttonText: "DIVIDE",),
                        ),   
                     ],
                                       ),
                   const Padding(padding: EdgeInsets.only(top: 40.0)),
                   Text("OUTPUT: $sum", style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 28.0),),
                  ],
                ),
                     ),
             ),
           ),
         ),],
       ),
    );
  }
}
