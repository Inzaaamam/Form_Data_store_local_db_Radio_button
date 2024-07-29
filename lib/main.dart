import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/screen/cubit.dart';
import 'package:task/screen/db.dart';
import 'package:task/screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormDataCubit(DatabaseService()),
      child: MaterialApp(
        title: 'Form Data App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(), // Make sure HomeScreen is provided here
      ),
    );
  }
}
