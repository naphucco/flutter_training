import 'dart:async';
import 'package:http/http.dart' as http;

import '../models/module.dart';

class ModuleService {
  final StreamController<List<Module>> _controller = StreamController<List<Module>>();
  // Getter for itemsStream
  Stream<List<Module>> get itemsStream => _controller.stream;
  // Mock data list
  List<Module> mockData = [
    Module('Item 1', 'Description for item 1'),
    Module('Item 2', 'Description for item 2'),
    Module('Item 3', 'Description for item 3'),
  ];

  void fetchModules() async {
    try {
        await Future.delayed(const Duration(seconds: 2));
    // Simulate fetching data
      _controller.add(mockData);
      
      // final response = await http.get(Uri.parse('apiUrl'));
      // if (response.statusCode == 200) {
      //   // List<dynamic> jsonData = json.decode(response.body);
      //   // List<Module> items = jsonData.map((item) => Module.fromJson(item)).toList();
      //   // Simulate delay to mimic async behavior (e.g., fetching from API)
      //   await Future.delayed(Duration(seconds: 2));
      //   // Simulate fetching data
      //   _controller.add(mockData);
      // } else {
      //   throw Exception('Failed to load items');
      // }
    } catch (e) {
      throw Exception('Failed to load items: $e');
    }
  }

  void dispose() {
    _controller.close();
  }
}
