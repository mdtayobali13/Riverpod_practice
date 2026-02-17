
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final textProvider = StateProvider((ref){
  return " ";
});

class Controller extends ConsumerStatefulWidget {
  const Controller({super.key});

  @override
  ConsumerState<Controller> createState() => _ControllerState();
}

class _ControllerState extends ConsumerState<Controller> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller=TextEditingController();
    _controller.addListener((){
      ref.read(textProvider.notifier).state = _controller.text;
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final text = ref.watch(textProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
            ),
            SizedBox(height: 10,),
            Text("Txte type $text")
          ],
        ),
      ),
    );
  }
}
