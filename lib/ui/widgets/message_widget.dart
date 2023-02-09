import 'package:flutter/material.dart';
import 'package:streams_tutorial/data/models/message_model.dart';

class MessageWidget extends StatelessWidget {
  MessageModel message;
   MessageWidget({required this.message,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-32,
      margin: const EdgeInsets.all(4),
      alignment: !message.isAi?Alignment.centerRight:Alignment.centerLeft,
      child: Container(
        decoration:  BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(topLeft: const  Radius.circular(8),topRight:const  Radius.circular(8),bottomRight: Radius.circular(message.isAi?8:0),bottomLeft: Radius.circular(!message.isAi?8:0))
        ),
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(
            minWidth: 80,
            maxWidth: 200
        ),
        child: Text(message.answer,style: const  TextStyle(color: Colors.white),),
      ),
    );
  }
}
