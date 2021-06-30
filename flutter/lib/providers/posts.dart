import 'dart:collection';
import 'dart:convert';
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
      List decodedBody = json.decode(response.body);
      _posts = decodedBody.map((jsonPost) => Post.fromJson(jsonPost)).toList();
      notifyListeners();
    }
  }

  Future<void> notePost(String postId, int note) async {
    Post post = posts.firstWhere((post) => post.id == postId);
    http.Response response = await http.patch(
      Uri.parse("$serverUrl/posts/$postId"),
      headers: {'Content-type': 'application/json'},
      body: json.encode({'newNote': note}),
    );
    print(response.request);
    print(response.statusCode);
  }
}
