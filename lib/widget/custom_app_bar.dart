import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.context,
    this.title,
  }) : super(key: key);

  final BuildContext context;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          title!,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
        backgroundColor: REDDIT_ORANGE,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
