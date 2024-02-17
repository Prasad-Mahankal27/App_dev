import 'package:flutter/material.dart';

const String _name ="Prasad";

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

        Container(
          margin: const EdgeInsets.only(right: 16),
          child: CircleAvatar(child: Text(_name[0]),),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(_name, style: Theme.of(context).textTheme.headlineSmall,),
            Container(margin: const EdgeInsets.only(top: 5), child: Text(text),)
          ],
        )
      ]),
    );
  }
}