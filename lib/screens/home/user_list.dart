import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gkdnt/models/user_model.dart';
import 'package:gkdnt/screens/home/user_tile.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<UserModel>?>(context) ?? [];

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(title: UserTile(user: users[index]));
      },
    );
  }
}
