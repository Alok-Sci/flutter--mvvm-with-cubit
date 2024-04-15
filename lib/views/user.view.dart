
// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_with_cubit/viewmodels/user.view.model.dart';
import 'package:mvvm_with_cubit/models/user.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserView extends StatelessWidget {
  final UserViewModel userCubit = UserViewModel();
  final Widget action = IconButton(
    icon: const Icon(Icons.settings_outlined),
    onPressed: () {},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users list'),
        actions: [action],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Container(
            height: 500,
            child: BlocBuilder<UserViewModel, User>(
                // ! UserViewModel is Cubit; User is State
                bloc: userCubit,
                builder: (context, user) {
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Wrap(
                                alignment: WrapAlignment.start,
                                direction: Axis.horizontal,
                                spacing: 10,
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    foregroundImage:
                                        AssetImage('assets/images/image.webp'),
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${user.name ?? 'User'}',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('${user.email ?? 'john@doe.com'}')
                                      ]),
                                ])
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: TextEditingController(
                              text: '${user.name ?? "e.g. John Doe"}'),
                          decoration: InputDecoration(
                            enabled: false,
                            labelText: 'Name',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: TextEditingController(
                              text: '${user.email ?? "e.g. john@doe.com"}'),
                          decoration: InputDecoration(
                            enabled: false,
                            labelText: 'Email',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: TextEditingController(
                              text: '${user.mobile.toString() ?? ''}'),
                          decoration: InputDecoration(
                            enabled: false,
                            labelText: 'Mobile',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _editUser(context, user);
                          },
                          child: Text('Update Information'),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  _editUser(BuildContext context, User user) {
    showDialog(
        context: context,
        builder: (context) {
          String? name = user.name ?? '';
          String? email = user.email ?? '';
          int? mobile = user.mobile ?? 0;

          return AlertDialog(
            title: Text('Edit your profile'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                    controller: TextEditingController(text: user.name),
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      name = value;
                    }),
                SizedBox(height: 20),
                TextField(
                    controller: TextEditingController(text: user.email),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      email = value;
                    }),
                SizedBox(height: 20),
                TextField(
                    controller:
                        TextEditingController(text: user.mobile.toString()),
                    decoration: InputDecoration(
                      labelText: 'Mobile',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      mobile = value as int;
                      print("mobile is integer value: ${mobile is int}");
                      print(mobile.runtimeType);
                    }),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    User updatedUser = User(
                      name: name,
                      email: email,
                      mobile: mobile,
                    );
                    // print("Updated User: $updatedUser");
                    userCubit.updateUser(updatedUser);
                    Navigator.pop(context);
                  },
                  child: Text('Update profile'),
                ),
              ],
            ),
          );
        });
  }
}
