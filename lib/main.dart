import 'package:flutter/material.dart';
import 'theme.dart';
import 'presentation/views/profile.dart';
import 'presentation/views/splash.dart';
import 'presentation/views/verification.dart';
import 'presentation/views/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CPOL Test Project',
      theme: theme(),
      routes: {
        'profile': (context) => const ProfilePage(),
        'splash': (context) => const SplashPage(),
        'verification': (context) => const VerificationPage(),
        'welcome': (context) => const WelcomePage(),
      },
      home: const SplashPage(),
      // home: ,
    );
  }
}
