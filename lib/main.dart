import 'package:flutter/material.dart';
import 'package:lista_filmes/screens/controller/service_locator.dart';

import 'package:lista_filmes/screens/home.dart';

void main() {
  runApp(
    const MyApp(),
  );
  setupLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de filmes com integração API',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(movieContext: context),
    );
  }
}
