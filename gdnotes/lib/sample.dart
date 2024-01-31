import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Column(
         mainAxisSize: MainAxisSize.min,
         children: [
           Form(
               child: Column(
             children: [
               Image.network(
                   "https://cdn.dribbble.com/users/587823/screenshots/3999739/media/c8c3c6987607ae30428c4d2b9b2ce873.png?resize=800x600&vertical=center"
               ,),
               TextFormField(
                // decoration: const InputDecoration(
                //   hintText: 'Welcome to GD Notes!',
                  // labelText: '',
                 //),
                 validator: (value) {
                   if (value == null || value.isEmpty || value.length<7) {
                     return 'Please enter some text';
                   }
                   return null;
                 },
               ),
             ],
           ))
         ],
       ),
   ); //return const Placeholder();
  }
}
