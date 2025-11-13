import 'package:flutter/foundation.dart';
import 'package:todo_app_arch/data/repositories/TodoRepository.dart';

class TodoViewModel extends ChangeNotifier {
  final TodoRepository _repository;

  TodoViewModel(this._repository);

  List<String> _todos = [];
  bool _isLoading = false;

  List<String> get todos => _todos;
  bool get isLoading => _isLoading;

  Future<void> loadTodos() async {
    _isLoading = true;
    notifyListeners();

    _todos = await _repository.getTodos();

    _isLoading = false;
    notifyListeners();
  }
}