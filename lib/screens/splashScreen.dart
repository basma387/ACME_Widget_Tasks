import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgettasks/theme/colors.dart';
import 'package:widgettasks/theme/textStyles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffF1F5FE),
        body:
        Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text("Welcome", style:TextStyle(color: Colors.black, fontSize:40, fontWeight:FontWeight.bold),),
            SizedBox(height:20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.blue,
                foregroundColor: Colors.black,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: TextStyles.titleWhite,
              ),
              child: Text("Sign Up", style:TextStyles.titleWhite,),
              onPressed:() {
                context.go("/login");
              },
            ), 

            SizedBox(height:20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.blue,
                foregroundColor: Colors.black,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: TextStyles.titleWhite,
              ),
              child: Text("View Profile", style:TextStyles.titleWhite,),
              onPressed:() {
                context.go("/profile");
              },
            ), 
          ]
        )
      ),
      ),
    );
  }
}