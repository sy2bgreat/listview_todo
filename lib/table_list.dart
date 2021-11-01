import 'package:flutter/material.dart';
import 'package:listview_todo_app/detail_list.dart';
import 'package:listview_todo_app/message.dart';
import 'package:listview_todo_app/todo_list.dart';

class TableList extends StatefulWidget {
  const TableList({Key? key}) : super(key: key);

  @override
  _TableListState createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  List<TodoList> todoList = [];

  @override
  void initState() {
    super.initState();
    todoList
        .add(TodoList(imagePath: "images/cart.png", workList: "buying books"));
    todoList.add(TodoList(
        imagePath: "images/clock.png", workList: "meeting with soyoon"));
    todoList.add(TodoList(
        imagePath: "images/pencil.png", workList: "get ready for studying"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main view"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/insert')
                    .then((value) => rebuildData());
              },
              icon: const Icon(Icons.add_outlined))
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 70,
                child: GestureDetector(
                  child: Card(
                    child: Row(
                      children: [
                        Image.asset(todoList[position].imagePath,
                            height: 100, width: 100, fit: BoxFit.contain),
                        Text("   ${todoList[position].workList}"),
                      ],
                    ),
                  ),
                  onTap: () {
                    Message.workList = todoList[position].workList;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailList();
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  rebuildData() {
    setState(() {
      if (Message.action == true) {
        todoList.add(
          TodoList(imagePath: Message.imagePath, workList: Message.workList),
        );
        Message.action = false;
      }
    });
  }
}
