import 'package:flutter/material.dart';
import 'package:project_idea/pages/main.dart';
// ignore: unused_import
import 'package:project_idea/pages/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyJournalPage extends StatefulWidget {
  const MyJournalPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyJournalPageState createState() => _MyJournalPageState();
}

class _MyJournalPageState extends State<MyJournalPage> {
  final List<String> _checkedItems = [];

  void _handleCheckboxChanged(String value) {
    if (_checkedItems.contains(value)) {
      _checkedItems.remove(value);
    } else {
      _checkedItems.add(value);
    }
    setState(() {});
  }

  void _saveEntry() {
    // Save the entry to the database
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tell me about your day'),
            const SizedBox(height: 16.0),
            ...List.generate(5, (index) {
              String value = index == 0
                  ? 'An awesome day'
                  : index == 1
                      ? 'A good day'
                      : index == 2
                          ? 'A normal day'
                          : index == 3
                              ? 'A terrible day'
                              : 'Probably the worst day of this week';
              return Row(
                children: [
                  Checkbox(
                    value: _checkedItems.contains(value),
                    onChanged: (value) {
                      _handleCheckboxChanged(value! as String);
                    },
                  ),
                  Text(value),
                ],
              );
            }).toList(),
            const SizedBox(height: 16.0),
            TextField(
              maxLines: 20,
              onChanged: (value) {},
              decoration: const InputDecoration(
                hintText: 'Write your entry here...',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveEntry,
              child: const Text('SAVE'),
            ),
          ],
        ),
      ),
    );
  }
}
