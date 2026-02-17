import 'dart:math';
class FakeApi {
  Future<String> getFckApi() async {
    await Future.delayed(Duration(seconds: 1));
    if (Random().nextDouble() > 0.3) {
      throw Exception("Failed to fetch greeting");
    }
    return "Hello From Async!";
  }
}

