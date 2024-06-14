import 'package:flutter/material.dart';
import 'package:mca_project/presentation/common/theme/theme.dart';
import 'package:mca_project/presentation/features/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCA Project',
      theme: AppTheme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
