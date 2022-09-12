import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/handler/html_handler.dart';
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
            imageUrl: HtmlHandler.parseUrl(data: currentPost),
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
            const CircleAvatar(child: Icon(Icons.person)),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("r/${currentPost.subreddit}"),
                Text("u/${currentPost.author}"),
              ],
            ),
          ],
        ),
        Row(
          children: [
            TextButton(child: const Text("Join"), onPressed: () {}),
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
              const Icon(Icons.arrow_upward_rounded),
              SizedBox(width: 8.w),
              Text(currentPost.ups.toString()),
              SizedBox(width: 8.w),
              const Icon(Icons.arrow_downward_outlined)
            ],
          ),
          Row(
            children: [
              const Icon(Icons.comment),
              SizedBox(width: 8.w),
              Text(currentPost.numComments.toString()),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.share),
              SizedBox(width: 8.w),
              const Text("Share"),
            ],
          )
        ],
      ),
    );
  }
}
