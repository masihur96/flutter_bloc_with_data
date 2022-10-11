import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  const UserListTile(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.avatar})
      : super(key: key);
  final String? firstName;
  final String? lastName;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(
          firstName!,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          lastName!,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: CircleAvatar(
          backgroundImage: NetworkImage(avatar!),
        ),
      ),
    );
  }
}
