import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:my_project_name/models/user.dart';

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
    Module('Item 1', 'Description for item 1'),
    Module('Item 2', 'Description for item 2'),
    Module('Item 3', 'Description for item 3'),
    Module('Item 1', 'Description for item 1'),
    Module('Item 2', 'Description for item 2'),
    Module('Item 3', 'Description for item 3'),
    Module('Item 1', 'Description for item 1'),
    Module('Item 2', 'Description for item 2'),
    Module('Item 3', 'Description for item 3'),
    Module('Item 1', 'Description for item 1'),
    Module('Item 2', 'Description for item 2'),
    Module('Item 3', 'Description for item 3'),
    Module('Item 1', 'Description for item 1'),
    Module('Item 2', 'Description for item 2'),
    Module('Item 3', 'Description for item 3'),
    Module('Item 1', 'Description for item 1'),
    Module('Item 2', 'Description for item 2'),
    Module('Item 3', 'Description for item 3'),
    Module('Item 1', 'Description for item 1'),
    Module('Item 2', 'Description for item 2'),
    Module('Item 3', 'Description for item 3'),
    Module('Item 1', 'Description for item 1'),
    Module('Item 2', 'Description for item 2'),
    Module('Item 3', 'Description for item 3'),
    Module('Item 1', 'Description for item 1'),
    Module('Item 2', 'Description for item 2'),
    Module('Item 3', 'Description for item 3'),
  ];

  void fetchModules() async {
    try {
      HttpOverrides.global = MyHttpOverrides();
      // Simulate fetching data
      Map<String, String> headers = {"accept": "text/plain", "Content-Type": "application/json"};
      Uri uri = Uri.https('localhost:44348', 'api/Account/GetUserInfoByUserId/1689');
      final response = await http.get(uri, headers: headers);
      print('Response status: ${User.fromJson(json.decode(response.body))}');
      // Simulate fetching data
      _controller.add(mockData);
    } catch (e) {
      throw Exception('Failed to load items: $e');
    }
  }

  void dispose() {
    _controller.close();
  }
}

 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}