import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_with_cubit/models/user.model.dart';

class UserViewModel extends Cubit<User> {
  // ! pass initial state to the super cunstructor
  UserViewModel()
      : super(
            User()); // ! setting User model's instance as the initial state for the current Cubit

  // User user = User(name: '', email: '');

  // void addUser({required String name, required String email, int? mobile, String? address}){
  //   User user = User(name: name, email: email, mobile: mobile, address: address);
  //   emit(user);
  // }

  // void updateUser({required String name, required String email, int? mobile, String? address}){
  //   User user = User(name: name, email: email, mobile: mobile, address: address);
  //   emit(user);
  // }

  // void get user => User();
  void updateUser(User user) => emit(user);

  void deleteUser() {
    User user = User(name: '', email: '', mobile: 0);
    emit(user);
  }
}
