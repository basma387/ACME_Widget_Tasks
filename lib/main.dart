import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgettasks/screens/Products.dart';
import 'package:widgettasks/screens/Profile.dart';
import 'package:widgettasks/screens/createAccount.dart';
import 'package:widgettasks/screens/splashScreen.dart';

void main(){
  runApp(const MyApp());
}

  final GoRouter _router=GoRouter(
    initialLocation:"/splash",
    routes:[
      GoRoute(path: "/splash",builder:  ((context,state)=> const SplashScreen())),
      GoRoute(path: "/profile",builder:  ((context,state)=> const Profile())),
      GoRoute(path: "/products",builder:  ((context,state)=> const Products())),
      GoRoute(path: "/login",builder:  ((context,state)=> const CreateAccount())),
    ]);

class MyApp extends StatelessWidget{
  const MyApp({super.key});

@override
Widget build(BuildContext context){
  return MaterialApp.router(
    debugShowCheckedModeBanner: false,
    title:"My Application",
    routerConfig: _router,
  );
  
}
}



