import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  
  String _email = '';
  String _password = '';
  bool _isSecureText = true;

  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     print('Email: $_email');
  //     print('Password: $_password');
  //   }
  // }

  void _submitForm() {
  if (_formKey.currentState!.validate()) {
    // Validate will trigger the onSaved callbacks
    _formKey.currentState!.save();

    // Form is valid, proceed with registration
  
    print('Email: $_email');
    print('Password: $_password');
  }
}


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Colors.white, // You can choose any background color you want
          ),
        ),
        Positioned(
          top: -130,
          right: -140,
          child: Container(
            width: 400,
            height: 400,
            decoration: const BoxDecoration(
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
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff553c51),
            ),
          ),
        ),
        Positioned(
          top: 130,
          left: 30,
          child: Text("Welcome \nAhmed",
              style: GoogleFonts.montserrat(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        Positioned(
          bottom: -200,
          left: -20,
          child: Container(
            width: 405,
            height: 300,
            decoration: const BoxDecoration(
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
                        color: const Color(0xfffa5951),
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
        Positioned(
          child: Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 110),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Add your login fields and buttons here
                    Container(
                      width: 290,
                      child: TextFormField(
                       validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      width: 290,
                      child: TextFormField(
                       validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$').hasMatch(value)) {
                    return 'Password must contain at least one uppercase letter, one lowercase letter, and one digit';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
                        obscureText: _isSecureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () => {
                              setState(() {
                                _isSecureText = !_isSecureText;
                              })
                            },
                            icon: const Icon(Icons.remove_red_eye_outlined),
                            color: const Color.fromARGB(150, 85, 60, 81),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(left: 167),
                      child: TextButton(
                          onPressed: () {},
                          child: Text("Forgot Password",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ))),
                    ),
                    const SizedBox(height: 40),

                    ElevatedButton(
                      onPressed: () {
                        _submitForm();
                        //                    if (_formKey.currentState!.validate()) {
                        //   print('Email: $_email');
                        //   print('Password: $_password');
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfffa5951),
                        minimumSize: const Size(210, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30.0), // Pill shape
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
