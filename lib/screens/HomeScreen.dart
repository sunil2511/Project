import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/Model/UserDataModel.dart';
import 'package:flutter_application_2/screens/UserDataApi.dart';

import 'menuDrawer.dart';

class HomeScreen extends StatefulWidget {
  var ePassword;

  var eUserName;

  HomeScreen(
    this.eUserName,
    this.ePassword, {
    Key key,
  }) : super(key: key);
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<UserDataModel> Data = [];
  final List<String> _UserData = [];
  String _UserList;
  @override
  void initState() {
    getUsersMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: menuDrawer(context),
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  cursorColor: Color(0xff374767),
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    icon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Color(0xff374767),
                      ),
                    ),
                    hintText: 'Search',
                  ),
                  //controller: searchController,
                  onChanged: (values) {},
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  child: Image.asset('assets/images/flutter_head.png'),
                  height: 200,
                  width: 200,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                ),
                Text(
                  "Data",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void getUsersMethod() {
    getUsersDetails().then((value) => {
          if (value != null)
            {
              Data = value,
              print(value.toString()),
            
              
            }
        });
  }
}
