


import 'package:flutter/material.dart';

class BrowseCoursesScreen extends StatefulWidget {
  const BrowseCoursesScreen({super.key});

  @override
  State<BrowseCoursesScreen> createState() => _BrowseCoursesScreenState();
}

class _BrowseCoursesScreenState extends State<BrowseCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Browse Courses Screen',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
