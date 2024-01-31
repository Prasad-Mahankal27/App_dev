import 'package:flutter/material.dart';
import 'package:flutter_yt/new.dart';

void main() {
  runApp(
    const MaterialApp(
  home: Scaffold(
 body: New(),
  ) 
 ));
}


// Center(
//       child: ElevatedButton(child: const Text("Open"), onPressed: (){
//                 showModalBottomSheet(context: context, builder: (BuildContext context){
//                     return SizedBox(
//                         height: 400,
//                         child: Center(child: ElevatedButton(child: const Text("Close"), onPressed: () {
//                           Navigator.pop(context);
//                         },),),
//                     );
//                 });
//               },),
//     );