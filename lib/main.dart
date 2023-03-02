import 'package:flutter/material.dart';
import 'package:test_invest/core/di.dart';
import 'package:test_invest/presentation/screens/chart_screen.dart';

late GlobalKey<NavigatorState> globalKey;

void main() {
  Di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    globalKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: globalKey,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      home: const ChartScreen(),
    );
  }
}
