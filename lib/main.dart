import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'class_3/future_Provider.dart';
import 'class_4/animation.dart';
import 'class_4/controller.dart';
import 'class_5/strime_provider.dart';
import 'class_6/counter_example/counter_screen.dart';
import 'class_6/todo_example/todu_screen.dart';
import 'class_7/async_notifier_screen.dart';
void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AsyncNotifierScreen()
    );
  }
}




