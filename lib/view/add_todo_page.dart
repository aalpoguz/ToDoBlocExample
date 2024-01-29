import 'package:flutter/material.dart';
import 'package:todo_with_bloc/models/todo_model.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _id = TextEditingController();
    TextEditingController _task = TextEditingController();
    TextEditingController _description = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeni Görev Ekle'),
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _inputField('ID', _id),
              _inputField('Task', _task),
              _inputField('Description', _description),
              ElevatedButton(
                onPressed: () {
                  var todo = Todo(
                    id: _id.value.text,
                    task: _task.value.text,
                    description: _description.value.text,
                  );

                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  child: const Text(
                    'Ekle',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Column _inputField(
  String field,
  TextEditingController controller,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '$field ',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(22.0)),
        height: 50,
        margin: const EdgeInsets.only(bottom: 15),
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration.collapsed(hintText: ''),
            ),
          ),
        ),
      ),
    ],
  );
}
