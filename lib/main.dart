import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/ui/home.dart';

import 'demo/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) {
        return Data();
      },
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}