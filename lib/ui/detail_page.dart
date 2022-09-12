import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/handler/html_handler.dart';
import 'package:reddit_clone/models/post_model.dart';
import 'package:reddit_clone/widget/custom_app_bar.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({Key? key, required this.post}) : super(key: key);
  final ChildData post;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppBar(
          context: context,
          title: post.author,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            CachedNetworkImage(
              imageUrl: HtmlHandler.parseUrl(data: post),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(post.title!,
                      style: Theme.of(context).textTheme.headline5),
                  SizedBox(height: 16.h),
                  Text(post.selftext!),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
