import 'dart:collection';
import 'package:cooking/environment/env.dart';
import 'package:http/http.dart' as http;
import 'package:cooking/models/Post.type.dart';
import 'package:flutter/material.dart';

class PostsProvider with ChangeNotifier {
  List<Post> _posts = [];

  UnmodifiableListView<Post> get posts => UnmodifiableListView(_posts);

  Future<void> fetchPosts() async {
    http.Response response = await http.get(Uri.parse("$serverUrl/posts"));
    if (response.statusCode == 200) {
      notifyListeners();
    }
  }
}
