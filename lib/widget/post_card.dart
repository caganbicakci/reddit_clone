// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/post_model.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.currentPost,
    required context,
  }) : super(key: key);

  final ChildData currentPost;

  @override
  Widget build(BuildContext context) {
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
              if (currentPost.thumbnail != null &&
                  currentPost.thumbnail != "self") {
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
  }
}
