import 'package:flutter/material.dart';

import 'package:login/SignUp.dart';
import 'package:login/LoginPage.dart';
import 'package:flutter/services.dart';

void main() async {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Color.fromARGB(0, 255, 255, 255)),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
      resizeToAvoidBottomInset: false,
        
      
        body: SignUp(),
      ),
    );
    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(

    //     body:

    //             // Login(),
    //             // SignUp()
    //             Llist()

    //   ),
    // );
  }
}
