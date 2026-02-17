import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stringProvider = Provider((ref){
  return "Hello World";
});

class ProviderString extends ConsumerWidget {
  const ProviderString({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final str = ref.watch(stringProvider);
    return Scaffold(
      body: Center(child: Text(str, style: TextStyle(fontSize: 50 , color: Colors.red),)),
    );
  }
}
