import 'package:flutter/material.dart';
import 'package:my_flutter_pro/pages/choose_location.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/choose_location.dart';
import 'package:http/http.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
    },
));