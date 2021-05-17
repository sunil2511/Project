import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/LoginScree.dart';
import 'package:flutter_application_2/screens/RegisterScreen.dart';
import 'package:flutter_application_2/screens/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget menuDrawer(BuildContext context) {
   SharedPreferences _sharedPreferences;
  SharedPreferences.getInstance().then((value) {
    _sharedPreferences = value;
    IsLogin = _sharedPreferences.getBool('IsLogin') ?? false;
    });
  return SafeArea(
    top: true,
    child: Container(
      width: 200,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            // Expanded(

            //   child: new Image.asset(

            //     'assets/images/flutter_head.png',

            //     width: MediaQuery.of(context).size.width,

            //   ),

            // ),

            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.login_rounded,
                    color: Colors.blueGrey,
                    size: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 17),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.blueGrey,
            ),

            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.app_registration,
                    color: Colors.blueGrey,
                    size: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Registration',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 17),
                    ),
                  ),
                ],
              ),
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
              },
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.blueGrey,
            ),
               (IsLogin)
            ? ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.logout,
                     color: Colors.blueGrey,
                      size: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Logout',
                        style:
                            TextStyle(color: Colors.blueGrey,fontSize: 17),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  _sharedPreferences.setBool('IsLogin', false);
                  IsLogin = false;
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              )
            : ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.login,
                      color: Colors.blueGrey,
                      size: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Login',
                        style:
                            TextStyle(color: Colors.blueGrey,fontSize: 17),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            // ListTile(
            //   title: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Icon(
            //         Icons.logout,
            //         color: Colors.blueGrey,
            //         size: 20,
            //       ),
            //       Padding(
            //         padding: EdgeInsets.all(10),
            //         child: Text(
            //           'Logout',
            //           style: TextStyle(color: Colors.blueGrey, fontSize: 17),
            //         ),
            //       ),
            //     ],
            //   ),
            //   onTap: () {},
            // ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    ),
  );
  }
  