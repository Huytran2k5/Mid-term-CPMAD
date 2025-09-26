import 'package:flutter/material.dart';
import 'package:gkdnt/models/user_model.dart';

class UserTile extends StatelessWidget {
  final UserModel user;
  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[200],
            child: const Icon(Icons.emoji_food_beverage, color: Colors.brown),
          ),
          title: Text(user.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Type: ${user.milkTeaType}'),
              Text(
                'Topping: ${user.toppings.isNotEmpty ? user.toppings.join(", ") : "None"}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
