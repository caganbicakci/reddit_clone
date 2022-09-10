import 'package:flutter/material.dart';
import 'package:reddit_clone/bloc/post_bloc/post_bloc.dart';
import 'package:reddit_clone/ui/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: BlocProvider(
        create: (context) => PostBloc(),
        child: const HomePage(title: 'Reddit Demo'),
      ),
    );
  }
}
