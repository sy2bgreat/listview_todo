import 'package:flutter/material.dart';
import 'package:listview_todo_app/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  _InsertListState createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add View"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: "type it",
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (textController.text.isNotEmpty) {
                    addList();

                    Navigator.pop(context);
                  }
                },
                child: const Text("OK"),
              )
            ],
          ),
        ),
      ),
    );
  }

  addList() {
    setState(() {
      Message.imagePath = "images/pencil.png";
      Message.workList = textController.text;
      Message.action = true;
    });
  }
}
