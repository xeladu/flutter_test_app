import 'package:flutter/material.dart';
import 'package:flutter_test_app/assets/gen/colors.gen.dart';
import 'package:flutter_test_app/features/course_overview/course_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorName.surfaceColorsSurface,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const CourseOverviewScreen(),
    );
  }
}
