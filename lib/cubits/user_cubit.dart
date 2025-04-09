import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_with_cubit/models/user_model.dart';

class UserCubit extends Cubit<User> {
  /// * initial state (User model's instance with empty values)
  UserCubit() : super(User());

  /// * text editing controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();

  /// * getter to get the current state
  User get user => state;

  /// ! update user (emit the new user object)
  void updateUser(User user) {
    _updateControllers(user);

    /// * emit the new user object
    emit(user);
  }

  /// ! update the controllers
  void _updateControllers(User user) {
    nameController.text = user.name ?? '';
    emailController.text = user.email ?? '';
    mobileController.text = user.mobile ?? '';
  }

  /// ! delete user (emit the initial state)
  void deleteUser() => emit(User());

  /// ! on update user pressed (emit the new user object)
  void onUpdateUserPressed(BuildContext context) {
    /// * create a new user object
    User updatedUser = User(
      name: nameController.text,
      email: emailController.text,
      mobile: mobileController.text,
    );

    /// * update the user object
    updateUser(updatedUser);

    /// * pop the dialog
    Navigator.pop(context);
  }
}
