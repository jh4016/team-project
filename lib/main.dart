import 'package:flutter/material.dart';
import 'package:teamproject/HomePage.dart';
import 'package:teamproject/teammembers.dart';
List<TeamMember> teamMembers = [];

void main() {
  runApp(TeamProjectApp());
}

class TeamProjectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Project',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          Colors.blue.value,
          const <int, Color>{
            50: Color(0xFFE5F6FD),
            100: Color(0xFFBEE9FA),
            200: Color(0xFF8DDCF7),
            300: Color(0xFF5BCFF4),
            400: Color(0xFF37C4F3),
            500: Color(0xFF14B9F1),
            600: Color(0xFF13A7D8),
            700: Color(0xFF0F91BA),
            800: Color(0xFF0B7C9C),
            900: Color(0xFF075770),
          },
        ),
      ),
      home: HomePage(),
    );
  }
}
