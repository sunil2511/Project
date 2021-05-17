import 'dart:convert';

import 'package:flutter_application_2/screens/Model/UserDataModel.dart';
import 'package:http/http.dart' as http;

Future<List<UserDataModel>> getUsersDetails() async {
  String url = 'https://reqres.in/api/users?page=1';
  Uri baseUri = Uri.parse(url);
  final http.Response response = await http.post(
    baseUri,
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{}),
  );
  print(response.statusCode);
  print(response.body);
  
   try {
    if (response.body != null && response.body.isNotEmpty) {
      List<UserDataModel> dealers = (json.decode(response.body) as List)
          .map((data) => UserDataModel.fromJson(data))
          .toList();
          print(dealers.toString());
      return dealers;
    }
  } // try {
  //   if (response.body != null && response.body.isNotEmpty) {
  //     var userResponse=UserDataModel.fromJson(json.decode(response.body));
  //     if(userResponse.data.length!=0){
  //       userResponse.data.forEach((element) {
  //         userResponse.data[0].firstName.toString();
  //         print("Data Is:"+ userResponse.data[0].firstName.toString());
  //         return userResponse.data;
  //       });

  //     }
  //   }

  // } 
  catch (e) {
    print(e.toString());
  }
  return null;
}
