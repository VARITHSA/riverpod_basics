import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// * we are using stateNotifier and stateNotifierProvider
// * we are going to havea a simple counter application and every time the button gets pressed the counter needs to update itself
// ! This is Example -2 of riverpod_basics
// * StateNotifier is the class from the flutter not from rivepod, we can set and read the value
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

// ! we are creating Infix operator
final stateProvider = StateProvider<int>(((ref) {
  return 0;
}));

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
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final val = ref.watch(stateProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('Value : $val')),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () => ref.read(stateProvider.notifier).state++,
            child: const Center(child: Icon(Icons.add)),
          ),
          FloatingActionButton(
            onPressed: () => ref.read(stateProvider.notifier).state--,
            child: const Center(child: Icon(Icons.delete_outline)),
          ),
        ],
      ),
    );
  }
}
