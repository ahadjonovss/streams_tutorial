import 'package:flutter/material.dart';
import 'package:streams_tutorial/ui/main_page.dart';
import 'package:streams_tutorial/utils/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const  MainPage(),
    );
  }
}

