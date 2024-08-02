import 'package:flutter/material.dart';
import 'package:todoapp_client/todoapp_client.dart';
import 'dart:developer';

import 'package:todoapp_flutter/src/sessionmanager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo>? _todos;

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  _loadTodos() async {
    final todos = await client.todo.getAllTodo();
    setState(() {
      _todos = todos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTododialog();
        },
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Todo Application'),
        actions: [
          IconButton(
            onPressed: () {
              sessionManager.signOut();
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.red,
              size: 36,
            ),
          ),
        ],
      ),
      body: _todos == null
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : _todos!.isEmpty
              ? const Center(
                  child: Text('You have no Todos'),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _todos!.map((todos) {
                    return ListTile(
                      onTap: () {
                        _showTododialog(todos);
                      },
                      title: Text(todos.title),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await client.todo.deleteTodo(todos);
                          _loadTodos();
                        },
                      ),
                    );
                  }).toList(),
                ),
    );
  }

  _showTododialog([Todo? todo]) {
    return showDialog(
      context: context,
      builder: (context) {
        final titlecrl = TextEditingController(text: todo?.title);
        final descriptionctrl = TextEditingController(text: todo?.description);
        return AlertDialog.adaptive(
          title: TextFormField(
            controller: titlecrl,
            onChanged: (value) {
              log(value, name: 'title');
            },
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          content: TextFormField(
            controller: descriptionctrl,
            onChanged: (value) {
              log(value, name: 'descritption');
            },
            maxLines: 4,
            minLines: 4,
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () async {
                if (todo != null) {
                  final updatedodo = todo.copyWith(
                    description: descriptionctrl.text,
                    title: titlecrl.text,
                  );
                  await client.todo.updateTodo(updatedodo);
                } else {
                  final newtodo = Todo(
                    title: titlecrl.value.text,
                    description: descriptionctrl.value.text,
                    isCompltetd: false,
                    userID: sessionManager.signedInUser!.id!,
                  );

                  await client.todo.createTodo(newtodo);
                }

                _loadTodos();
                Navigator.pop(context);
              },
              child: const Text('Save'),
            )
          ],
        );
      },
    );
  }
}
