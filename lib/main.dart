import 'package:deep_rooted_test/src/ui/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto-Trades Ledger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, canvasColor: Colors.white),
      home: const SafeArea(child: MainScreen()),
    );
  }
}
