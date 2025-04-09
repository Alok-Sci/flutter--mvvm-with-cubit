// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_with_cubit/cubits/user_cubit.dart';
import 'package:mvvm_with_cubit/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserView extends StatelessWidget {
  /// * instance of UserCubit
  final UserCubit userCubit = UserCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: BlocBuilder<UserCubit, User>(

            /// * bloc is linked with the UserCubit
            bloc: userCubit,
            builder: (context, user) {
              /// * user is the current state of the UserCubit
              /// * update the user state when the userCubit is updated
              userCubit.updateUser(user);

              return Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    /// * name textfield
                    TextField(
                      controller: userCubit.nameController,
                      decoration: InputDecoration(
                        enabled: false,
                        labelText: 'Name',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    /// * email textfield
                    TextField(
                      controller: userCubit.emailController,
                      decoration: InputDecoration(
                        enabled: false,
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    /// * mobile textfield
                    TextField(
                      controller: userCubit.mobileController,
                      decoration: InputDecoration(
                        enabled: false,
                        labelText: 'Mobile',
                      ),
                      onChanged: (mobile) {
                        userCubit.mobileController.text = mobile;
                      },
                    ),
                    const Spacer(),

                    /// * edit user information button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                      ),
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
    );
  }

  _editUser(BuildContext context, User user) {
    /// * show an alert dialog with the user's profile information fields
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit your profile'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// * name text field
                TextField(
                  controller: userCubit.nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: user.name,
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (name) {
                    userCubit.nameController.text = name;
                  },
                ),
                SizedBox(height: 20),

                /// * email text field
                TextField(
                  controller: userCubit.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: user.email,
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (email) {
                    userCubit.emailController.text = email;
                  },
                ),
                SizedBox(height: 20),

                /// * mobile text field
                TextField(
                  controller: userCubit.mobileController,
                  decoration: InputDecoration(
                    labelText: 'Mobile',
                    hintText: user.mobile.toString(),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (mobile) {
                    userCubit.mobileController.text = mobile;
                  },
                ),
                SizedBox(height: 20),

                /// * update profile button
                ElevatedButton(
                  onPressed: () => userCubit.onUpdateUserPressed(context),
                  child: Text('Update profile'),
                ),
              ],
            ),
          );
        });
  }
}
