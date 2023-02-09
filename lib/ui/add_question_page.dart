import 'package:flutter/material.dart';

class AddQuestionPage extends StatelessWidget {
  AddQuestionPage({Key? key}) : super(key: key);

  TextEditingController answer = TextEditingController();
  TextEditingController question = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          children:  [
            TextField(
              controller: question,
              decoration: const InputDecoration(
                hintText: "Your Question"
              ),
            ),
            TextField(
              controller: answer,
              decoration:  const InputDecoration(
                hintText: "Your answer"
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {

            }, child: const Text("Save"))
          ],
        ),
      ),
    );
  }
}
