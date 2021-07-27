import 'package:flutter/material.dart';
import 'package:milota/pages/menu.dart';
import 'package:milota/pages/addChild.dart';
import 'package:milota/pages/showListOfChildren.dart';

Map<int, Color> mainColor = {
  50:Color.fromRGBO(176, 137, 147, .1),
  100:Color.fromRGBO(176, 137, 147, .2),
  200:Color.fromRGBO(176, 137, 147, .3),
  300:Color.fromRGBO(176, 137, 147, .4),
  400:Color.fromRGBO(176, 137, 147, .5),
  500:Color.fromRGBO(176, 137, 147, .6),
  600:Color.fromRGBO(176, 137, 147, .7),
  700:Color.fromRGBO(176, 137, 147, .8),
  800:Color.fromRGBO(176, 137, 147, .9),
  900:Color.fromRGBO(176, 137, 147, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF9F6B79, mainColor);

void main() => runApp(MaterialApp(
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