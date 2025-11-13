// lib/ui/todo/todo_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_arch/ui/todo/TodoViewModel.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TodoViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Minhas Tarefas')),
      body: Center(
        child: viewModel.isLoading
            ? const CircularProgressIndicator()
            : ListView.builder(
          itemCount: viewModel.todos.length,
          itemBuilder: (context, index) {
            final todo = viewModel.todos[index];
            return ListTile(
              title: Text(todo),
              leading: const Icon(Icons.check_box_outline_blank),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.loadTodos(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
