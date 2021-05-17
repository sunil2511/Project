import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/LoginScree.dart';
import 'package:flutter_application_2/screens/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeScreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  TextEditingController _RemailController = TextEditingController();
  TextEditingController _RpasswordController = TextEditingController();
  SharedPreferences _sharedPreferences;
  String rEmail, rPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create your account"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          
          child: Column(
            children: [
               Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Image.asset(
                      'assets/images/flutter_head.png',
                      fit: BoxFit.cover,
                    ),
                       ),
              Card(
                color: Colors.blue[100],
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 16, bottom: 8),
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (val) {
                              setState(() {
                                rEmail = val;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Email can't be empty";
                              } else {
                                rEmail = value;
                              }
                              return null;
                            },
                            controller: _RemailController,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.email_rounded,
                                color: Colors.blueGrey,
                              ),
                              hintText: 'Enter Email Address',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 16, bottom: 8),
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Password can't be empty";
                              } else {
                                rPassword = value;
                              }
                              return null;
                            },
                            onChanged: (val) {
                              setState(() {
                                rPassword = val;
                              });
                            },
                            controller: _RpasswordController,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock_outline_rounded,
                                color: Colors.blueGrey,
                              ),
                              hintText: 'Enter Password',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 16, bottom: 8),
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Confirm Password can't be empty";
                              } else {
                                // _email = value;
                              }
                              return null;
                            },

                            //controller: emailPhoneController,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock_outline_rounded,
                                color: Colors.blueGrey,
                              ),
                              hintText: 'Enter Confirm Password',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width,
                        height: 42,
                        child: new RaisedButton(
                          child: new Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                _sharedPreferences?.setBool("IsLogin", true);
                                _sharedPreferences?.setString(
                                    "UserName", _RemailController.text);
                                _sharedPreferences?.setString(
                                    "Password", _RpasswordController.text);
                                eUserName = _RemailController.text;
                                ePassword = _RpasswordController.text;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomeScreen(eUserName, ePassword)));
                              });
                              await _RegisterData();
                                                      }
                                                    },
                                                    color: Colors.white,
                                                    highlightColor: Colors.blueGrey,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Alredy't have an Account?",
                                                    style: TextStyle(
                                                        color: Colors.white, fontFamily: 'ProductSans'),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => LoginScreen()));
                                                      },
                                                      child: Text(
                                                        "Login",
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
            ],
          ),
                                  ),
                                ),
                              );
                            }
                          
                            void _RegisterData()async {
                               final User user = (await auth.createUserWithEmailAndPassword(
            email: _RemailController.text, password: _RpasswordController.text))
        .user;
    if (user != null) {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(eUserName, ePassword)));
    }
                            }
}
