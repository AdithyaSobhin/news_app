import 'package:flutter/material.dart';
import 'package:news_app/controller/detailed_screen_controller.dart';

import 'package:news_app/controller/home_screen_controller.dart';
import 'package:news_app/controller/search_screen_controller.dart';
import 'package:news_app/view/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailedScreenController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
