import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_project_name/models/module.dart';
import 'package:my_project_name/screens/login_page.dart';
import 'package:my_project_name/services/module_service.dart';

class SelectionModuleScreen extends StatefulWidget {
  const SelectionModuleScreen({super.key});

  @override
  SelectionModuleScreenState createState() => SelectionModuleScreenState();
}

class SelectionModuleScreenState extends State<SelectionModuleScreen> {
  // Example list of items
  ModuleService apiService = ModuleService();
  List<Module> moduleList = [];

  @override
  void initState() {
    super.initState();
    apiService.fetchModules();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Select nation'),
        ),
        child: StreamBuilder<List<Module>>(
            stream: apiService.itemsStream, // StreamBuilder listens to itemsStream updates
            builder: (context, snapshot) {
              print('aaaaaaaaaaaaaaaaa = ${snapshot.data}');
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CupertinoActivityIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No data available'));
              } else {
                moduleList = snapshot.data ?? []; // Update moduleList with snapshot data
                return ListView.builder(
                  itemCount: moduleList.length,
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
                            moduleList[index].title,
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            moduleList[index].subtitle,
                            style: TextStyle(fontSize: 14, color: CupertinoColors.inactiveGray),
                          ),
                          Divider(), // Optional divider between items
                        ],
                      ),
                    );
                  },
                );
              }
            }));
  }
}
