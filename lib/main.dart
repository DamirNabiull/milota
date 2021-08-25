import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:milota/pages/menu.dart';
import 'package:milota/pages/addChild.dart';
import 'package:milota/pages/showListOfChildren.dart';
import 'package:milota/assets/colors.dart';

void initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

void main() {
  initFirebase();
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Color.fromARGB(255, 176, 137, 147),
      primarySwatch: colorCustom,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => Menu(),
      '/add': (context) => AddChild(),
      '/list': (context) => ShowListOfChildren(),
    },
  ),);
}