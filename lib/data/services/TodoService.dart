class TodoService {
  TodoService();

  var todos = ['Estudar Flutter', 'Fazer exercícios', 'Ler documentação'];

  Future<List<String>> fetchTodos() async {
    // Simula uma chamada de API
    await Future.delayed(const Duration(seconds: 1));
    return todos;
  }

  Future<void> addTodo(String todo) async {
    // Simula uma chamada de API
    await Future.delayed(const Duration(seconds: 1));
    todos.add(todo);
  }
}
