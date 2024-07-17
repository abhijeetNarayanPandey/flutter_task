import 'package:flutter/material.dart';
import 'package:new_task/item.dart';
import 'package:new_task/item_provider.dart';
import 'package:provider/provider.dart';


class ListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemProvider>(
      builder: (context, itemProvider, child) {
        return ListView.builder(
          itemCount: itemProvider.items.length,
          itemBuilder: (context, index) {
            final item = itemProvider.items[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.description),
              onTap: () {
                _showEditDialog(context, itemProvider, index, item);
              },
              onLongPress: () {
                _showDeleteDialog(context, itemProvider, index);
              },
            );
          },
        );
      },
    );
  }

  void _showEditDialog(
      BuildContext context, ItemProvider itemProvider, int index, Item item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: item.name,
              onChanged: (value) {
                item.name = value;
              },
            ),
            TextFormField(
              initialValue: item.description,
              onChanged: (value) {
                item.description = value;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              itemProvider.editItem(index, item);
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, ItemProvider itemProvider, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Item'),
        content: Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () {
              itemProvider.removeItem(index);
              Navigator.pop(context);
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('No'),
          ),
        ],
      ),
    );
  }
}

