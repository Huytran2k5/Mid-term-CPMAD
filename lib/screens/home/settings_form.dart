import 'package:flutter/material.dart';
import 'package:gkdnt/models/user.dart';
import 'package:gkdnt/services/database.dart';
import 'package:gkdnt/shared/constants.dart';
import 'package:gkdnt/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> allToppings = [
    'Black Pearl',
    'Jelly',
    'Pudding',
    'Cheese Cream',
    'White Pearl',
    'Coconut Jelly',
  ];

  // form values
  String? _currentName;
  String? _currentMilkTeaType;
  List<String> _currentToppings = [];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user!.uid).userData,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          UserData? userData = asyncSnapshot.data;
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const Text(
                    'Update your settings.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData!.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  const SizedBox(height: 20.0),
                  DropdownButtonFormField<String>(
                    decoration: textInputDecoration.copyWith(
                      labelText: 'Type of Milk Tea',
                    ),
                    value: _currentMilkTeaType ?? userData.milkTeaType,
                    items: milkTeaTypes.map((type) {
                      return DropdownMenuItem(value: type, child: Text(type));
                    }).toList(),
                    onChanged: (val) =>
                        setState(() => _currentMilkTeaType = val),
                  ),
                  const SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Topping:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    child: ListView(
                      shrinkWrap: true,
                      children: allToppings.map((topping) {
                        final isChecked = _currentToppings.isEmpty
                            ? (userData.toppings.contains(topping))
                            : _currentToppings.contains(topping);
                        return CheckboxListTile(
                          title: Text(topping),
                          value: isChecked,
                          onChanged: (checked) {
                            setState(() {
                              if (checked == true) {
                                _currentToppings.add(topping);
                              } else {
                                _currentToppings.remove(topping);
                              }
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        );
                      }).toList(),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[400],
                    ),
                    child: const Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await DatabaseService(uid: user.uid).updateUserData(
                          _currentName ?? userData.name,
                          _currentMilkTeaType ?? userData.milkTeaType,
                          _currentToppings.isEmpty
                              ? userData.toppings
                              : _currentToppings,
                        );
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
