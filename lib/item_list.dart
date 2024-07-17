// item_list.dart
import 'package:flutter/material.dart';
import 'package:new_task/item_provider.dart';
import 'package:provider/provider.dart';
class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item Tracker')),
      body: Consumer<ItemProvider>(
        builder: (context, itemProvider, child) {
          return ListView.builder(
            itemCount: itemProvider.items.length,
            itemBuilder: (context, index) {
              final item = itemProvider.items[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.description),
                onTap: () {
                  // Implement edit functionality
                },
                onLongPress: () {
                  // Implement delete functionality
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement add functionality
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
