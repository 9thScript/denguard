import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'main_screen.dart';
import 'symptoms.dart';
import 'treatment.dart';
import 'article1_widget.dart';
import 'article2_widget.dart';
import 'article3_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DenGuard',
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomePageWidget(),
        '/main': (context) => const MainScreen(),
        '/symptoms': (context) => const SymptomsWidget(),
        '/treatment': (context) => const TreatmentWidget(),
        '/article1': (context) => const Article1Widget(),
        '/article2': (context) => const Article2Widget(),
        '/article3': (context) => const Article3Widget(),
      },
    );
  }
}
