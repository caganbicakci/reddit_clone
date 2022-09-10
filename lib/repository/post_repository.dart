import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import '../constants/api_constants.dart';
import '../models/post_model.dart';

class PostRepository {
  var logger = Logger();

  Future<List<Child>?> getPosts() async {
    var response = await http.get(Uri.parse(API_URL));

    if (response.statusCode != 200) {
      return null;
    } else {
      List<Child> postData = [];
      var result = jsonDecode(response.body);

      try {
        var post = PostData.fromJson(result["data"]);
        for (var child in post.children!) {
          postData.add(child);
        }
      } catch (e) {
        Logger().e(e.toString());
      }
      return postData;
    }
  }
}
