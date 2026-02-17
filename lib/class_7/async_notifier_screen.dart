import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'async_notifier.dart';

class AsyncNotifierScreen extends ConsumerWidget {
  const AsyncNotifierScreen({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final greetingAsync = ref.watch(greetingAsyncProvider);
    final greetingAsyncNotifier = ref.read(greetingAsyncProvider.notifier);
    return Scaffold(
      body: Center(
        child: greetingAsync.when(
          loading: () => const CircularProgressIndicator(),
          error: (e, _) => Text('Error: $e'),
          data: (g) => Text(g, style: const TextStyle(fontSize: 24)),
        ),
    ),
      floatingActionButton: FloatingActionButton(
      onPressed: greetingAsyncNotifier.refreshGreeting,
      child: const Icon(Icons.refresh),
    ),
    );
  }
}
