import 'package:flutter/material.dart';
import 'package:widgettasks/screens/Products.dart';
import 'package:widgettasks/screens/Profile.dart';
import 'package:widgettasks/screens/emptyScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Products(),
       routes: {
        '/screen': (context) => EmptyScreen(),
        '/profile': (context) => Profile(),
        '/products': (context) => Products(),

      }
    ),
    );
}

