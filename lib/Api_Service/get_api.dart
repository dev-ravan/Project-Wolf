// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ravan/Models/user_model.dart';
import '../Models/single_user_model.dart';

class GetApi extends ChangeNotifier {
// =========== User Details Model ==============

  List<UsersList> UserDetails = [];

  void getUserDetails() {
    UsersDetails().then((value) => {
          // ignore: unnecessary_null_comparison
          if (value!.data.isEmpty)
            {UserDetails = [], notifyListeners()}
          else
            {
              UserDetails = [],
              UserDetails = [...value.data],
              notifyListeners(),
            }
        });
  }

  Future<UsersModel?> UsersDetails() async {
    final http.Response response = await http.get(
      Uri.parse("https://reqres.in/api/users?page=2"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return usersModelFromJson(response.body);
    } else {
      return usersModelFromJson(response.body);
    }
  }

  // =========== Single User Details Model ==============

  Future<SingleUserModel?> SingleUserDetails(int id) async {
    final http.Response response = await http.get(
      Uri.parse("https://reqres.in/api/users/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return singleUserModelFromJson(response.body);
    } else {
      return singleUserModelFromJson(response.body);
    }
  }
}
