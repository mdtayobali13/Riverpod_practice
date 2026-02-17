import 'package:flutter_riverpod/legacy.dart';
import 'package:rivarport_play_list/class_6/todo_example/todo_model.dart';


final todoLitProvider = StateNotifierProvider<TodoProviderController ,List<TodoModel>>((ref){
  return TodoProviderController([]);
});


class TodoProviderController extends StateNotifier<List<TodoModel>> {
  TodoProviderController(super.state);

  void add(String title) {
    final newTodo = TodoModel(
      id: state.isEmpty ? 0 : state.last.id + 1,
      title: title,
      complete: false,
    );
    state = [...state, newTodo];
  }

  void remove(int id){
    state = state.where((i)=>i.id != id).toList();
  }
  void toggle(int id) {
    state = state.map((todo) {
      if (todo.id == id) {
        return todo.copyWith(
          complete: !todo.complete,

        );
      }
      return todo;
    }).toList();
  }
}
