import 'dart:convert';

import 'package:bloc_flutter/data/constant.dart';
import 'package:bloc_flutter/data/models/user_model.dart';

import 'package:dio/dio.dart';

import '../data_providers/connection_helper.dart';

class UserRepository {
  final ConnectionHelper _connectionHelper = ConnectionHelper();
  // Fetch All User
  Future<List<UserModel>> getAllUser() async {
    List<UserModel> allUser = [];

    Response? response = await _connectionHelper.getData(API.endPoint);
    if (response != null) {
      if (response.statusCode == 200) {
        var data = response.data;
        var users = data["data"];
        for (var user in users) {
          allUser.add(
            UserModel(
              firstName: user["first_name"],
              lastName: user["last_name"],
              avatar: user["avatar"],
              id: user['id'],
              email: user['email'],
            ),
          );
        }
      }
    }
    return allUser;
  }
}
