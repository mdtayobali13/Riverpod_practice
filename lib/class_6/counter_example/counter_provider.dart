import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final counterProvider = StateNotifierProvider<CounterState , int>((ref){
  return CounterState(0);
});

class CounterState extends StateNotifier<int>{
  CounterState(super.state);

  void increment()=> state++;
  void decrement()=>state--;
  void reset()=>state = 0;
}