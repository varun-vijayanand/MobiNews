import 'package:flutter/material.dart';

import 'package:updt/views/splashscreen.dart';

void main() {
  runApp(MyApp());
}

const primaryColor = Color(0xFFFAFAFA);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
     color: Colors.grey.shade50,
  ),
        primaryColor: primaryColor,
      ),
      home: SplashScreen(),
    );
  }
}
