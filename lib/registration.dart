import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glossy/glossy.dart';
import 'package:google_fonts/google_fonts.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureText2 = true;
  TextEditingController password = TextEditingController();
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _togglePasswordVisibility2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(title: Text(''), backgroundColor: Colors.transparent),
        // Gradient background
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF2E3192), Color(0xFF1BFFFF)],
            ),
          ),
          // Center the glossy container
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Sign in",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // First Name and Last Name in a Row
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Data';
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
                                      FontAwesomeIcons.user,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  hintText: "First Name",
                                  hintStyle: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),

                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Data';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Align(
                                    widthFactor: 1.0,
                                    heightFactor: 1.0,
                                    child: FaIcon(
                                      FontAwesomeIcons.user,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Last Name",
                                  hintStyle: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Phone Number
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Data';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: FaIcon(
                                FontAwesomeIcons.phone,
                                color: Colors.blue,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Phone Number",
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),

                      // Email
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Data';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Email",
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            prefixIcon: Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: FaIcon(
                                FontAwesomeIcons.solidEnvelope,
                                color: Colors.blue,
                              ),
                            ),
                            labelStyle: GoogleFonts.roboto(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),

                      // Password
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: _obscureText,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Data';
                            }
                            return null;
                          },
                          // obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: FaIcon(
                                FontAwesomeIcons.key,
                                color: Colors.blue,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Password",
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
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

                      // Confirm Password
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: _obscureText2,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Email';
                            }
                            return null;
                          },

                          decoration: InputDecoration(
                            prefixIcon: Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: FaIcon(
                                FontAwesomeIcons.key,
                                color: Colors.blue,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Confirm Password",
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            labelStyle: GoogleFonts.roboto(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            suffixIcon: IconButton(
                              onPressed: _togglePasswordVisibility2,
                              icon: Icon(
                                _obscureText2
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
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
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.white,
                                thickness: 2,
                                indent: 2,
                              ),
                            ),
                            Text(
                              "Or",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.white,
                                thickness: 2,
                                indent: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
                            iconSize: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
