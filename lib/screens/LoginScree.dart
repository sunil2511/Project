import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/RegisterScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomeScreen.dart';
import 'constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    taskAsynk();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  SharedPreferences _sharedPreferences;

  String email, Password;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login to your account"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
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
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Email can't be empty";
                                    } else {
                                      email = value;
                                    }
                                    return null;
                                  },
                                  onChanged: (v) {
                                    setState(() {
                                      email = v;
                                    });
                                  },
                                  // onSaved: (val) => _email = val,
                                  controller: _emailController,
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
                                      Password = value;
                                    }
                                    return null;
                                  },
                                  onChanged: (v) {
                                    setState(() {
                                      email = v;
                                    });
                                  },
                                  //onSaved: (val) => _password = val,
                                  controller: _passwordController,
                                  decoration: new InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        Icons.lock,
                                        color: Colors.blueGrey,
                                      ),
                                      hintText: 'Enter Password'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          (isLoading)
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 16.0),
                                  child: ButtonTheme(
                                    minWidth: MediaQuery.of(context).size.width,
                                    height: 42,
                                    child: new RaisedButton(
                                      child: new Text(
                                        "Sign In",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          setState(() {
                                            _sharedPreferences?.setBool(
                                                "IsLogin", true);
                                            _sharedPreferences?.setString(
                                                "UserName",
                                                _emailController.text);
                                            _sharedPreferences?.setString(
                                                "Password",
                                                _passwordController.text);
                                            eUserName = _emailController.text;
                                            ePassword =
                                                _passwordController.text;
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen(eUserName,
                                                            ePassword)));
                                          });
                                          await _loginData();
                                        }
                                      },
                                      color: Colors.white,
                                      highlightColor: Colors.blueGrey,
                                    ),
                                  ),
                                )
                              : Container(
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 12.0, right: 16.0),
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an Account?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'ProductSans'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterScreen()));
                                  },
                                  child: Text(
                                    "Register Now",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _loginData() async {
    final User user = (await auth.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text))
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

  taskAsynk() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
