import 'package:flutter/material.dart';
import 'package:login/ApiData.dart';
import 'package:login/SignUp.dart';
import 'package:login/Home.dart';
import 'package:login/LoginPage.dart';
import 'package:flutter/services.dart';

void main() async {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: []);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
      resizeToAvoidBottomInset: false,
        
      
        body: ListViewExample(),
      ),
    );
    
  }
}
