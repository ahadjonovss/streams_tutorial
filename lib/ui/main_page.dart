import 'package:flutter/material.dart';
import 'package:streams_tutorial/ui/add_question_page.dart';
import 'package:streams_tutorial/ui/chat_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Page"),),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddQuestionPage(),));
              }, child: const Text("Add question")),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage(),));

              }, child: const Text("Chat Page")),
            ],
          ),
        ),
      ),
    );
  }
}
