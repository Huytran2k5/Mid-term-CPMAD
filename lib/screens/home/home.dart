import 'package:gkdnt/screens/home/settings_form.dart';
import 'package:flutter/material.dart';
import 'package:gkdnt/services/auth.dart';
import 'package:gkdnt/services/database.dart';
import 'package:provider/provider.dart';
import 'package:gkdnt/screens/home/user_list.dart';
import 'package:gkdnt/models/user_model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService auth = AuthService();
    return StreamProvider<List<UserModel>?>.value(
      value: DatabaseService(uid: '').users,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Milk Tea Order'),
          backgroundColor: Colors.lightBlue[100],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('logout'),
              onPressed: () async {
                await auth.signOut();
              },
            ),
            TextButton.icon(
              icon: const Icon(Icons.settings),
              label: const Text('settings'),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 60.0,
                      ),
                      child: SettingsForm(),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: UserList(),
      ),
    );
  }
}
