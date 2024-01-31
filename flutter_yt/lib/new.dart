import 'package:flutter/material.dart';

class New extends StatefulWidget{
const New({super.key});

@override
State<New> createState(){
  return _NewState();
}
}

class _NewState extends State<New>{
@override
Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: (){
          showModalBottomSheet(context: context, builder: (BuildContext context){
            return SizedBox(
              height: 400,
              child: Center(child: ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text("Close")))
            );
          });
      }, child: const Text("Open"))
    );
  }
}