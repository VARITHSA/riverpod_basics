import 'package:flutter/material.dart';

// * Riverpod gives conviences to work with and also watch the changes on the value
// * It is all about providing values asynchronously and watch those changes and make the different changes as necessary
// * They are global function 
// * When providers are created with riverpod something like providerScope should also be mentioned since ProviderScope allows us handle diiferent providers using riverpods
// * ProviderScope is the bridge b/w riverpod and Flutter world
// ! We are doing 6 Examples each in different branches 

void main() {
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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
