import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_project_name/screens/login_page.dart';

import '../models/list_item.dart';

class SelectionModuleScreen extends StatefulWidget {
  const SelectionModuleScreen({super.key});

  @override
  SelectionModuleScreenState createState() => SelectionModuleScreenState();
}

class SelectionModuleScreenState extends State<SelectionModuleScreen> {
  // Example list of items
  final List<ListItem> items = [
    ListItem('Item 1', 'Description for item 1'),
    ListItem('Item 2', 'Description for item 2'),
    ListItem('Item 3', 'Description for item 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('First Screen'),
      ),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CupertinoButton(
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items[index].title,
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  items[index].subtitle,
                  style: TextStyle(fontSize: 14, color: CupertinoColors.inactiveGray),
                ),
                Divider(), // Optional divider between items
              ],
            ),
          );
        },
      ),
    );
  }
}
