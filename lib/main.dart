import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_with_cubit/home.dart';
import 'package:mvvm_with_cubit/cubits/note_cubit.dart';
import 'package:mvvm_with_cubit/cubits/user_cubit.dart';
import 'package:mvvm_with_cubit/theme/theme_data.dart';
import 'cubits/comment_cubit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// using create inject cubits as dependency,
    /// so that widget tree can access the single instance of corresponding cubits
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CommentCubit()),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => NoteCubit()),
      ],
      child: MaterialApp(
        title: 'MVVM with Cubit',
        debugShowCheckedModeBanner: false,

        /// * using custom theme data
        theme: kThemeData,
        home: Home(),
      ),
    );
  }
}
