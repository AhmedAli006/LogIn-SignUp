import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
                        color: Color(0xfffa5951),
        ),
      
        Positioned(
          top: -230,
          left: -150,
          child: Container(
            width: 350,
            height: 350,
           decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.elliptical(120, 180),
                bottomRight: Radius.elliptical(120, 180),
              ),
              color: Color(0xff553c51),
            ),
          ),
        ),
        Positioned(
          top: 130,
          left: 30,
          child: Container(
            child: Text("Create\nAccount",
                style: GoogleFonts.montserrat(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
        Positioned(
          bottom: -200,
          left: -20,
          child: Container(
            width: 405,
            height: 300,
            decoration: const BoxDecoration(
              // shape: BoxShape.circle,
              // borderRadius: BorderRadius.all(Radius.elliptical(200, 110)),
              borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(190, 200),
                topRight: Radius.elliptical(190, 200),
              ),

              color: Color(0xff553c51),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 60,
          child: Row(
            children: [
              Container(
                child: Text("Already have an account? ",
                    style: GoogleFonts.montserrat(color: Colors.white)),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.montserrat(
                        color: Color(0xfffa5951), fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
        Positioned(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 110),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Add your login fields and buttons here
                  Container(
                    width: 290,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          color: Colors.white
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                        labelText: 'Name',
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 290,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          color: Colors.white
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 290,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.white
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                        suffixIcon: IconButton(
                          onPressed: () => {
                            // setState(() {
                            //   _isSecureText = !_isSecureText;
                            // })
                          },
                          icon: const Icon(Icons.remove_red_eye_outlined),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  Container(
                    width: 290,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(
                          color: Colors.white
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                        suffixIcon: IconButton(
                          onPressed: () => {
                            // setState(() {
                            //   _isSecureText = !_isSecureText;
                            // })
                          },
                          icon: const Icon(Icons.remove_red_eye_outlined),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),

                  
                  SizedBox(height: 40),

                  ElevatedButton(
                    onPressed: () {
                      // Implement your login functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(210, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0), // Pill shape
                      ),
                    ),
                    child: const Text('SIGN UP',
                    style:TextStyle(
                    color: Color(0xfffa5951),

                    ) 
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}