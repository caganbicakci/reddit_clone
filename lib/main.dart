import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/bloc/post_bloc/post_bloc.dart';
import 'package:reddit_clone/constants/strings.dart';
import 'package:reddit_clone/repository/post_repository.dart';
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
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: BlocProvider(
            create: (context) => PostBloc(postRepository: PostRepository()),
            child: const HomePage(title: APP_NAME),
          ),
        );
      },
    );
  }
}
