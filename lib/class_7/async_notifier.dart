
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivarport_play_list/class_3/future_Provider.dart';
final greetingAsyncProvider = AsyncNotifierProvider<GreetingAsyncNotifier, String>(
      () => GreetingAsyncNotifier(),
);

class GreetingAsyncNotifier extends AsyncNotifier<String>{
  @override
  FutureOr<String> build() async{
   return await ref.read(fakeApiProvider).getFckApi();
  }

  Future<void> refreshGreeting() async{

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(()=>ref.read(fakeApiProvider).getFckApi());


    // try{
    //   state = const AsyncValue.loading();
    //   final value = await ref.read(fakeApiProvider).getFckApi();
    //    state = AsyncValue.data(value);
    //
    // }catch(e){
    //   state = AsyncError(e, StackTrace.current);
    // }
  }

}