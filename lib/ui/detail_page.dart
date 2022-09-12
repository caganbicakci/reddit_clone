import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:reddit_clone/constants/strings.dart';
import 'package:reddit_clone/handler/url_handler.dart';
import 'package:reddit_clone/models/post_model.dart';
import 'package:reddit_clone/widget/custom_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../widget/custom_button.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({Key? key, required this.post}) : super(key: key);
  final ChildData post;
  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppBar(
          context: context,
          title: post.author,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Builder(builder: (context) {
                      if (post.media == null) {
                        return CachedNetworkImage(
                          imageUrl: UrlHandler.parseImageUrl(data: post),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Container(),
                        );
                      } else {
                        if (post.media?.type == "youtube.com") {
                          return YoutubePlayer(
                              controller: getPlayerController(post.url!));
                        } else {
                          return Container();
                        }
                      }
                    }),
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(32.h),
              child: SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: DETAILS_BTN_TEXT,
                  function: () {
                    openUrlOnBrowser(
                        Uri.parse(UrlHandler.parsePostUrl(data: post)));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> openUrlOnBrowser(dynamic url) async {
    if (!await launchUrl(url)) {
      Logger().e('Could not launch $url');
    }
  }

  YoutubePlayerController getPlayerController(String videoUrl) {
    var videId = YoutubePlayer.convertUrlToId(videoUrl);
    return YoutubePlayerController(
        initialVideoId: videId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: true,
        ));
  }
}
