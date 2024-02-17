import 'package:chatme/chat.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<MyWidget> _messages = <MyWidget>[];

final TextEditingController _textController = TextEditingController();
Widget _textComposerWidget(){
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(children: <Widget>[
Flexible(child: 
TextField(
      decoration: const InputDecoration.collapsed(hintText: "Send a message"),
      controller: _textController,
      onSubmitted: _handleSubmitted,
    ),
),
IconTheme(
  data: const IconThemeData(color: Colors.blue),
  child: Container(
    margin: const EdgeInsets.symmetric(horizontal: 4),
    child: IconButton(onPressed: (){_handleSubmitted(_textController.text);}, icon: const Icon(Icons.send)),
  ),
)
    ],)
  );
} //WHILE ENTERING TEXT

void _handleSubmitted(String text){
_textController.clear();
MyWidget message = MyWidget(text: text); //TYPE KELELA TEXT CHAT.DART MADHE PATHAVLA, TITHUN WRAP HOUN AKKHA WIDGET message MADHE STORE ZALA
setState(() {
  _messages.insert(0, message); //LIST CHYA EKDAM KHALI (MHANJE 0 POSITION LA) INSERT KAR NAVIN MESAAGE
});
} //AFTER SUBMITTING TEXT

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        Flexible(child: ListView.builder(
          padding: const EdgeInsets.all(8),
          reverse: true,
          itemBuilder: (context, int index) => _messages[index], //for loop for messages countover iterator as index
          itemCount: _messages.length,
        )
        ),                                                       //ADHI ICON ANI NAV
        const Divider(height: 1,),                               //PADDING
        Container(decoration: BoxDecoration(color: Theme.of(context).cardColor), //ATTA ACTUAL MESSAGE 
        child: _textComposerWidget(),
        )
      ]);
  }
}