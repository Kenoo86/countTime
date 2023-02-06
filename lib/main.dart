import 'package:counttime/provider/time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider.value(
      value:MyProvider() ,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Input Picker Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: const ColorScheme.light()),
      home: const HomeScreen(),
    );
  }
}
