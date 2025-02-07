import 'package:flutter/material.dart';
import 'package:kilasiko/view_models/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kilasiko',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider<HomeViewModel>(
        create: (_) => HomeViewModel(),
        child: const HomeView(),
      ),
    );
  }
}
