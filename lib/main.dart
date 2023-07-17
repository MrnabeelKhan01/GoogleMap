import 'dart:collection';

import 'package:flutter/material.dart';

import 'presentation/view/map/map_view.dart';
import 'presentation/view/user_current_location/current_location_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        primarySwatch: Colors.brown,
      ),
      home:CurrentLocationView(),
    );
  }
}
