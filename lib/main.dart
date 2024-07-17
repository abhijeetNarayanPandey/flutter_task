// main.dart
import 'package:flutter/material.dart';
import 'package:new_task/list_item.dart';
import 'package:provider/provider.dart';
import 'package:new_task/item_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Item List App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Item List'),
          ),
          body: Material(
            child: ListItems(),
          ),
        ),
      ),
    );
  }
}