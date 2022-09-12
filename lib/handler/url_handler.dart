// ignore: depend_on_referenced_packages
import 'package:html/parser.dart' as hp;
import 'package:reddit_clone/models/post_model.dart';

class UrlHandler {
  static parseImageUrl({required ChildData data}) {
    var preview = data.preview;
    var url = preview != null
        ? hp.parse(preview.images!.first.source!.url).body!.text
        : "";

    return url;
  }

  static parsePostUrl({required ChildData data}) {
    var postUrl = hp.parse(data.url).body!.text;
    return postUrl;
  }
}
