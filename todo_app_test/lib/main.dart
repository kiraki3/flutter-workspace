import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  // Text 입력하는 controller
  final TextEditingController _controller = TextEditingController();
  // Todo 저장하는 List
  final List<Map<String, dynamic>> _todoList = [];

  // save method
  void _addTodo() {
    setState(() {
      _todoList.add({'title': _controller.text, 'completed': false});
      _controller.clear();
    });
  }

  // delete method
  void _deleteTodo(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  // completion toggle
  void _toggleCompletion(int index) {
    setState(() {
      _todoList[index]['completed'] = !_todoList[index]['completed'];
    });
  }

  //edit method
  void _editTodo(int index) {
    setState(() {
      final TextEditingController editController = TextEditingController(
        text: _todoList[index]['title'],
      );

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Edit Title'),
              content: TextField(
                controller: editController,
                decoration: const InputDecoration(
                  labelText: 'Edit your title',
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final String newTitle = editController.text.trim();
                    if (newTitle.isNotEmpty) {
                      setState(() {
                        _todoList[index]['title'] = newTitle;
                      });
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          });
    });
  }

  void _removeTodo(index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration:
                        const InputDecoration(labelText: 'Enter a task'),
                  ),
                ),
                TextButton(
                  onPressed: _addTodo,
                  child: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _todoList[index]['title'],
                      style: TextStyle(
                          decoration: _todoList[index]['completed']
                              ? TextDecoration.lineThrough
                              : null),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => _toggleCompletion(index),
                          icon: Icon(_todoList[index]['completed']
                              ? Icons.check_box_outlined
                              : Icons.check_box_outline_blank),
                        ),
                        IconButton(
                          onPressed: () => _editTodo(index),
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () => _removeTodo(index),
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
