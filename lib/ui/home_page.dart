import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/post_bloc/post_bloc.dart';

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
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(currentPost.author!),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Text(currentPost.title!,
                              style: Theme.of(context).textTheme.headline6),
                          SizedBox(height: 16.h),
                          Builder(builder: (context) {
                            if (state.posts![index].data!.thumbnail! !=
                                "self") {
                              return Image.network(currentPost.thumbnail!);
                            } else {
                              return Container();
                            }
                          }),
                          Text(
                            currentPost.selftext!,
                            overflow: TextOverflow.fade,
                            maxLines: 6,
                          ),
                        ],
                      ),
                    ),
                  );
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
