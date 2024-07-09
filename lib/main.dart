import 'package:flutter/material.dart';
import 'package:flutter_todo_app/pages/home_page.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  //initialize hive
  await Hive.initFlutter();

  //open the box
  var box = await Hive.openBox('mybox');
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.grey[900], // Darker shade of grey
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.grey[700]), // Accent color in grey
        scaffoldBackgroundColor: Colors.grey[100], // Light background color
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color.fromARGB(255, 182, 177, 177)),
          bodyMedium: TextStyle(color: Color.fromARGB(255, 151, 140, 140)),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.grey[900],
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 182, 177, 177),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.grey[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
    );
  }
}
