import 'package:flutter/material.dart';
import 'package:login/ApiData/ApiData.dart';
import 'package:login/InBox/Chat.dart';
import 'package:login/InBox/InBox.dart';
import 'package:login/SignUp.dart';
import 'package:login/Home.dart';
import 'package:login/LoginPage.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: []);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/chat',
      routes: {
        '/login' : (context) => const Login(),
        '/signup' : (context) => const SignUp(),
        '/home' : (context) => const Home(),
        '/inbox' : (context) => const InBox(),
        '/chat' : (context) => const Chat(),
      },
      home: const Scaffold(
        
      resizeToAvoidBottomInset: false,
        
      
        // body: Login(),
      ),
    );
    
  }
}
