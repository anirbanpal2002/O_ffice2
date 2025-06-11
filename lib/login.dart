import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:officeproject2/registration.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    child: Lottie.network(
                      "https://lottie.host/fdc5db3c-0bcf-4ccd-b2a4-853416370c52/oJ2vCRtP4R.json",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:
                        Colors.transparent, // Background color to see the shape
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Email',
                              labelStyle: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                              ),
                              prefixIcon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: FaIcon(
                                  FontAwesomeIcons.solidEnvelope,
                                  color: Colors.blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 0,
                                ),
                              ),
                              // enabledBorder: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(10),
                              //   borderSide: BorderSide(
                              //     // color: Colors.green,
                              //     // width: 1,
                              //   ),
                              // ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            obscureText: _obscureText,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: FaIcon(
                                  FontAwesomeIcons.shield,
                                  color: Colors.blue,
                                ),
                              ),
                              labelText: 'Password',
                              labelStyle: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 0,
                                ),
                              ),
                              suffixIcon: IconButton(
                                onPressed: _togglePasswordVisibility,
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.green,
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // Do something (e.g. submit)
                                  }
                                },
                                child: Text(
                                  " Log in ",
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Registration(),
                                  ),
                                );
                              },
                              child: Text(
                                "Register",
                                style: GoogleFonts.roboto(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            // FaIcon(
                            //   FontAwesomeIcons.arrowRight,
                            //   color: Colors.green,
                            // ),`
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.green,
                                thickness: 2,
                                indent: 2,
                              ),
                            ),
                            Text("Or"),
                            Expanded(
                              child: Divider(
                                color: Colors.green,
                                thickness: 2,
                                indent: 2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Image(
                            //   image: AssetImage("assets/images/img.png"),
                            //   height: 50,
                            //   width: 50,
                            // ),
                            IconButton(
                              onPressed: () {},
                              icon: FaIcon(FontAwesomeIcons.google),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
