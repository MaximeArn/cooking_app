import 'dart:collection';
import 'dart:convert';
import 'package:cooking/environment/env.dart';
import 'package:http/http.dart' as http;
import 'package:cooking/models/Post.dart';
import 'package:flutter/material.dart';

class PostsProvider with ChangeNotifier {
  List<Post> _posts = [];
  // List<Post> _filteredPosts = [];
  bool isLoading = false;

  UnmodifiableListView<Post> get posts => UnmodifiableListView(_posts);
  // UnmodifiableListView<Post> get filteredPosts => UnmodifiableListView(_filteredPosts);

//   void setFilteredPosts(String filter){
//       _filteredPosts = UnmodifiableListView(_posts
//           .where((post) => post.author["name"]!
//               .toLowerCase()
//               .startsWith(filter.toLowerCase()))
//           .toList());
// }
  Future<void> fetchPosts() async {
    isLoading = true;
    try {
      http.Response response = await http.get(Uri.parse("$serverUrl/posts"));
      if (response.statusCode == 200) {
        List decodedBody = json.decode(response.body);
        _posts =
            decodedBody.map((jsonPost) => Post.fromJson(jsonPost)).toList();
        notifyListeners();
        isLoading = false;
      }
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }

  Future<void> notePost(String postId, int note) async {
    try {
      http.Response response = await http.patch(
        Uri.parse("$serverUrl/posts/$postId"),
        headers: {'Content-type': 'application/json'},
        body: json.encode({'newNote': note}),
      );
      if (response.statusCode == 200) {
        int id = _posts.indexWhere((post) => post.id == postId);
        _posts[id] = Post.fromJson(json.decode(response.body));
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}
