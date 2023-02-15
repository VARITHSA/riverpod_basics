import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// * Riverpod gives conviences to work with and also watch the changes on the value
// * It is all about providing values asynchronously and watch those changes and make the different changes as necessary
// * They are global function
// * When providers are created with riverpod something like providerScope should also be mentioned since ProviderScope allows us handle diiferent providers using riverpods
// * ProviderScope is the bridge b/w riverpod and Flutter world
// ! We are doing 6 Examples each in different branches
// ? we are also using flutter hooks also

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

// ! creating 1st provider without any parameters but output is date and time
// ? here is ref is a window to the applicaiton and can be used
final currentDate = Provider<DateTime>(
  (ref) => DateTime.now(),
);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // * ref actually changes it in real time
    // ? wath() -> helps to watch the provider and asks to rebuild the widget whenever required
    final date = ref.watch(currentDate);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod'),
      ),
      body: Center(
          child: Text(
        date.toIso8601String(),
        style: Theme.of(context).textTheme.headline4,
      )),
    );
  }
}
