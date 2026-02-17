import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivarport_play_list/class_5/timer_service.dart';

final streamProvider = StreamProvider((ref) {
  final timerService = ref.read(timerServiceProvider);
  return timerService.tickError();
});

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Stream Provider")),
      body: Center(
        child: counter.when(
          data: (data) => Text("Value is ${data.toString()}", style: TextStyle(fontSize: 25)),
          error: (e, stackTrace) => Text(e.toString()),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
