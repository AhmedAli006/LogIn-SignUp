import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/LoginPage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  bool _isSecureText = true;
  bool _isSecureTextp = true;
  final _userController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Validate will trigger the onSaved callbacks
      // _formKey.currentState!.save();

      // Form is valid, proceed with registration
      // if (_password != _confirmPassword) {
      //   print("password does not Match");
      // }
      print('Name: $_name');
      print('Email: $_email');
      print('Password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xfffa5951),
          ),
          Positioned(
            top: -240,
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
            top: 110,
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Login()));
                    },
                    child: Text(
                      "Sign In",
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
                        margin: EdgeInsets.only(top: 100),
                        width: 290,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _name = value!;
                          },
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: 'Name',
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: 290,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value!;
                          },
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
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
                            if (!RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                                .hasMatch(value)) {
                              return 'Password must contain at least one uppercase letter, one lowercase letter, and one digit';
                            }
                            return null;
                          },
                          // onSaved: (value) {
                          //   _password = value!;
                          // },
                          // controller: , **************************************************
                          obscureText: _isSecureText,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: Colors.white),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            suffixIcon: IconButton(
                              onPressed: () => {
                                setState(() {
                                  _isSecureText = !_isSecureText;
                                })
                              },
                              icon: const Icon(Icons.remove_red_eye_outlined),
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      Container(
                        width: 290,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != _password) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          // onSaved: (value) {
                          //   _confirmPassword = value!;
                          // },
                          obscureText: _isSecureTextp,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: const TextStyle(color: Colors.white),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            suffixIcon: IconButton(
                              onPressed: () => {
                                setState(() {
                                  _isSecureTextp = !_isSecureTextp;
                                })
                              },
                              icon: const Icon(Icons.remove_red_eye_outlined),
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      ElevatedButton(
                        onPressed: () {
                          _submitForm();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size(210, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30.0), // Pill shape
                          ),
                        ),
                        child: const Text('SIGN UP',
                            style: TextStyle(
                              color: Color(0xfffa5951),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
