import 'package:flutter/material.dart';
import 'package:listview_todo_app/table_list.dart';
import 'package:listview_todo_app/insert_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) {
          return const TableList();
        },
        '/insert': (context) {
          return const InsertList();
        }
      },
    );
  }
}
