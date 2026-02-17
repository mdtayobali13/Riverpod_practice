
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fake_api.dart';
final fakeApiProvider = Provider((_) => FakeApi());

/// Create a Future Provider
final greetingFutureProvider = FutureProvider((Ref ref) async {
  final service = ref.read(fakeApiProvider);
  return await service.getFckApi();
});

/// UI Screen to display Future data
class GreetingScreen extends ConsumerWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the FutureProvider
    final greetingAsync = ref.watch(greetingFutureProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Async Greeting')),
      body: Center(
        /// Load data
        child: greetingAsync.when(
          skipLoadingOnRefresh: false,
          data: (greeting) => Text(greeting, style: const TextStyle(fontSize: 24)),
          error: (error, stackTrace) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Error: $error', style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => ref.refresh(greetingFutureProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
