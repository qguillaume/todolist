import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'todo_model.dart';

class TodoController extends GetxController {
  final box = GetStorage();
  var todos = <Todo>[].obs; // .obs pour réactivité

  @override
  void onInit() {
    super.onInit();
    initTodos();
  }

  void initTodos() {
    if (box.hasData('todos')) {
      var storedTodos = box.read<List>('todos');
      if (storedTodos != null) {
        todos.assignAll(storedTodos.map((e) => Todo.fromJson(e)));
      }
    }
  }

  void add(Todo todo) {
    todos.add(todo);
    saveTodos();
  }

  void remove(Todo todo) {
    todos.remove(todo);
    saveTodos();
  }

  void updateTodo(Todo updatedTodo) {
    int index = todos.indexWhere((todo) => todo.id == updatedTodo.id);
    if (index != -1) {
      todos[index] = updatedTodo;
      saveTodos();
    }
  }

  void saveTodos() {
    box.write('todos', todos.map((e) => e.toJson()).toList());
  }
}
