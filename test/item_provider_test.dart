import 'package:flutter_test/flutter_test.dart';
import 'package:new_task/item.dart';
import 'package:new_task/item_provider.dart';

void main() {
  group('ItemProvider Tests', () {
    test('Adding item adds it to the list', () {
      final provider = ItemProvider();
      final initialItemCount = provider.items.length;

      provider.addItem('Test Item', 'Description for Test Item');

      expect(provider.items.length, initialItemCount + 1);
      expect(provider.items.last.name, 'Test Item');
      expect(provider.items.last.description, 'Description for Test Item');
    });

    test('Editing item updates the correct item in the list', () {
      final provider = ItemProvider();
      final newItem = Item(name: 'Updated Item', description: 'Updated Description');

      provider.editItem(0, newItem);

      expect(provider.items[0].name, 'Updated Item');
      expect(provider.items[0].description, 'Updated Description');
    });

    test('Removing item removes it from the list', () {
      final provider = ItemProvider();
      final initialItemCount = provider.items.length;

      provider.removeItem(0);

      expect(provider.items.length, initialItemCount - 1);
    });
  });
}
