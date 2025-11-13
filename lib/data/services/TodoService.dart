class TodoService {
  TodoService();

  Future<List<String>> fetchTodos() async {
    // Simula uma chamada de API
    await Future.delayed(const Duration(seconds: 1));
    return ['Estudar Flutter', 'Fazer exercícios', 'Ler documentação'];
  }
}
