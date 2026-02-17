import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final count = StateProvider<int>((ref) => 0);


class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter with Riverpod')),
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final counter = ref.watch(count);
            return  Text(
              counter.toString(),
              style: const TextStyle(color: Colors.red, fontSize: 30 ,),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(count.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
