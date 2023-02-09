import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Add question")),
            ElevatedButton(onPressed: () {}, child: Text("Chat Page")),
          ],
        ),
      ),
    );
  }
}
