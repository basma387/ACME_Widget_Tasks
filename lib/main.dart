import 'package:flutter/material.dart';
import 'package:widgettasks/screens/Profile.dart';
import 'package:widgettasks/screens/emptyScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Profile(),
       routes: {
        '/screen': (context) => EmptyScreen(),
        '/profile': (context) => Profile(),

      }
    ),
    );
}

