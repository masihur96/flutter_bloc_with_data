import 'dart:convert';

import 'package:bloc_flutter/data/constant.dart';
import 'package:bloc_flutter/data/models/user_model.dart';
import 'package:http/http.dart';

import '../data_providers/connection_helper.dart';

class UserRepository {
  final ConnectionHelper _connectionHelper = ConnectionHelper();
  getUsers() async {
    Response response = await get(Uri.parse(API.endPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  // Fetch All ship
  Future<List<UserModel>> getAllUser() async {
    List<UserModel> allUser = [];
    print("From Data Repository: ${API.endPoint}");
    Response? response = await _connectionHelper.getData(API.endPoint);

    if (response != null) {
      if (response.statusCode == 200) {
        print("From Data Fetcher: ${API.endPoint}");
        var data = response.body;

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
