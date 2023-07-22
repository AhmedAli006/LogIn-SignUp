import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isSecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.white, // You can choose any background color you want
        ),
        Positioned(
          top: -130,
          right: -140,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xfffa5951),
            ),
          ),
        ),
        Positioned(
          top: -100,
          left: -90,
          child: Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff553c51),
            ),
          ),
        ),
        Positioned(
          top: 130,
          left: 30,
          child: Container(
            child: Text("Welcome \nAhmed",
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
                child: Text("Don't have an account? ",
                    style: GoogleFonts.montserrat(color: Colors.white)),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
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
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: 290,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () => {
                            setState(() {
                              _isSecureText = !_isSecureText;
                            })
                          },
                          icon: const Icon(Icons.remove_red_eye_outlined),
                          color: Color.fromARGB(150, 85, 60, 81),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 167),
                    child: TextButton(
                        onPressed: () {},
                        child: Text("Forgot Password",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ))),
                  ),
                  SizedBox(height: 40),

                  ElevatedButton(
                    onPressed: () {
                      // Implement your login functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xfffa5951),
                      minimumSize: Size(210, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0), // Pill shape
                      ),
                    ),
                    child: const Text('Login'),
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
