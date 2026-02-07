import 'package:flutter/material.dart';
import 'package:practice/ui/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:practice/ui/screens/home_screen/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}