import 'package:flutter/material.dart';
import 'package:flutter_application_etr/screens/homepage.dart';

void main() async {

runApp(const ResortSeekerApp());
}

class ResortSeekerApp extends StatefulWidget {
  const ResortSeekerApp({super.key});

  @override
  State<ResortSeekerApp> createState() => _ResortSeekerAppState();
}

class _ResortSeekerAppState extends State<ResortSeekerApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageScreen(),

    );
  }
}