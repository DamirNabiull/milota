import 'package:flutter/material.dart';
import 'package:milota/pages/menu.dart';
import 'package:milota/pages/addChild.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Color.fromARGB(255, 176, 137, 147),
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => Menu(),
    '/add': (context) => AddChild(),
  },
),);