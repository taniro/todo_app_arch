import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_arch/ui/todo/TodoViewModel.dart';
import 'package:todo_app_arch/utils/command.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TodoViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Todo App"), actions: [IconButton(onPressed: ()=> viewModel.loadTodos.executeNoArgs(), icon: Icon(Icons.refresh))],),
      body: Column(
        children: [
          if (viewModel.loadTodos.running)
            const CircularProgressIndicator(),

          if (viewModel.todos.isNotEmpty)
            Expanded(
            child: ListView.builder(
              itemCount: viewModel.todos.length,
              itemBuilder: (_, i) => ListTile(
                title: Text(viewModel.todos[i]),
              ),
            ),
          ),

          if (viewModel.addTodo.error)
            const Text("Erro ao adicionar", style: TextStyle(color: Colors.red)),

          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      label: Text("Novo TODO"),
                    ),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        viewModel.addTodo.execute(value);
                      }
                    },
                  ),
                ),
                if (viewModel.addTodo.running)
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}