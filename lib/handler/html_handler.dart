import 'package:html/parser.dart';
import 'package:reddit_clone/models/post_model.dart';

class HtmlHandler {
  static parseUrl({required ChildData data}) {
    var preview = data.preview;
    String url = "";
    preview != null
        ? url = parse(preview.images.first.source.url).body!.text
        : null;

    return url;
  }
}
