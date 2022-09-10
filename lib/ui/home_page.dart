import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post_bloc/post_bloc.dart';
import '../widget/post_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostInitial) {
              context.read<PostBloc>().add(PostLoadEvent());
            }
            if (state is PostLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PostLoadedState) {
              return ListView.builder(
                itemCount: state.posts!.length,
                itemBuilder: (context, index) {
                  var currentPost = state.posts![index].data!;
                  return PostCard(currentPost: currentPost, context: context);
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
