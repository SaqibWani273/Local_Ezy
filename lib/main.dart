import 'package:flutter/material.dart';
import 'package:mca_project/theme/theme.dart';
import 'package:mca_project/view/home_page.dart';

import 'view/dashboard/dashoard.dart';

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
