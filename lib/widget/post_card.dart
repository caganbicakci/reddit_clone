import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/constants/strings.dart';
import 'package:reddit_clone/constants/ui_contants.dart';
import 'package:reddit_clone/handler/url_handler.dart';
import '../models/post_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../ui/detail_page.dart';

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
      elevation: 5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                getPostHeader(),
                const Divider(),
                SizedBox(height: 8.h),
                getPostDetails(context),
              ],
            ),
          ),
          getPostBottom(),
        ],
      ),
    );
  }

  getPostDetails(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PostDetailPage(post: currentPost)),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(currentPost.title!,
              style: Theme.of(context).textTheme.headline6),
          SizedBox(height: 16.h),
          CachedNetworkImage(
            imageUrl: UrlHandler.parseImageUrl(data: currentPost),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => Container(),
          ),
          Text(
            currentPost.selftext!,
            overflow: TextOverflow.fade,
            maxLines: 6,
          ),
        ],
      ),
    );
  }

  getPostHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(child: IC_PERSON),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$REDDIT_SHORT${currentPost.subreddit}"),
                Text("$USER_SHORT${currentPost.author}"),
              ],
            ),
          ],
        ),
        Row(
          children: [
            TextButton(child: const Text(JOIN), onPressed: () {}),
            const Icon(Icons.more_horiz),
            SizedBox(width: 8.w)
          ],
        ),
      ],
    );
  }

  SizedBox getPostBottom() {
    return SizedBox(
      height: 32.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              IC_UP,
              SizedBox(width: 8.w),
              Text(currentPost.ups.toString()),
              SizedBox(width: 8.w),
              IC_DOWN
            ],
          ),
          Row(
            children: [
              IC_COMMENT,
              SizedBox(width: 8.w),
              Text(currentPost.numComments.toString()),
            ],
          ),
          Row(
            children: [
              IC_SHARE,
              SizedBox(width: 8.w),
              const Text(SHARE),
            ],
          )
        ],
      ),
    );
  }
}
