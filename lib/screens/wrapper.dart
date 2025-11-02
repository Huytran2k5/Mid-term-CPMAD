import 'package:flutter/material.dart';
import 'package:gkdnt/screens/authenticate/authenticate.dart';
import 'package:gkdnt/models/user.dart';
import 'package:gkdnt/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    // print(user); // Debug only

    if (user == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
