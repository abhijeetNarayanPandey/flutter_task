
import 'package:flutter/material.dart';
import 'package:new_task/item.dart';import 'package:flutter/foundation.dart';
import 'package:new_task/item.dart';

class ItemProvider with ChangeNotifier {
  List<Item> _items = [
    Item(name: 'Item 1', description: 'Description for Item 1'),
    Item(name: 'Item 2', description: 'Description for Item 2'),
    Item(name: 'Item 3', description: 'Description for Item 3'),
   Item(name: 'Item 4', description: 'Description for Item 4'),
    Item(name: 'Item 5', description: 'Description for Item 5'),
    Item(name: 'Item 6', description: 'Description for Item 6'),
     Item(name: 'Item 7', description: 'Description for Item 7'),
    Item(name: 'Item 8', description: 'Description for Item 8'),
    Item(name: 'Item 9', description: 'Description for Item 9'),
     Item(name: 'Item 10', description: 'Description for Item 10'),
    Item(name: 'Item 11', description: 'Description for Item 11'),
    Item(name: 'Item 12', description: 'Description for Item 12'),
  ];

  List<Item> get items => _items;

  void addItem(String name, String description) {
    Item newItem = Item(name: name, description: description);
    _items.add(newItem);
    notifyListeners();
  }
  void editItem(int index, Item newItem) {
    _items[index] = newItem;
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}