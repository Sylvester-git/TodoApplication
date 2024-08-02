import 'package:flutter/material.dart';
import 'package:todoapp_flutter/src/sessionmanager.dart';

import 'pages/home_screen.dart';
import 'pages/sigin_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializesessionmanager();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    sessionManager.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Serverpod Demo',
        theme: ThemeData(
            primaryColor: Colors.blue,
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.blue,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
            )),
        home:
            sessionManager.isSignedIn ? const HomePage() : const SignInPage());
  }
}
