import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:cooking/environment/env.dart';
import 'package:http/http.dart' as http;
import 'package:cooking/models/Post.dart';
import 'package:flutter/material.dart';

class PostsProvider with ChangeNotifier {
  List<Post> _posts = [];
  bool isLoading = false;

  UnmodifiableListView<Post> get posts => UnmodifiableListView(_posts);

  Future<void> fetchPosts() async {
    isLoading = true;
    try {
      http.Response response = await http.get(Uri.parse("$serverUrl/posts"));
      if (response.statusCode == 200) {
        List decodedBody = json.decode(response.body);
        _posts = decodedBody
            .map(
              (jsonPost) => Post.fromJson(jsonPost, isPopulated: true),
            )
            .toList();
        notifyListeners();
        isLoading = false;
      }
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }

  Future<void> notePost(
      {required String postId,
      required int newNote,
      required int previousNote}) async {
    try {
      http.Response response = await http.patch(
        Uri.parse("$serverUrl/posts/$postId/note"),
        headers: {'Content-type': 'application/json'},
        body: json.encode({
          'newNote': newNote,
          "previousNote": previousNote,
        }),
      );
      if (response.statusCode == 200) {
        int id = _posts.indexWhere((post) => post.id == postId);
        _posts[id].note = newNote;
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createPost(
      {required List<File> images, required String authorId}) async {
    // create the body to send to the server
    print(images);
    print(authorId);

    final newPost = {
      "author": authorId,
      "images": images,
    };

    http.Response reponse = await http.post(
      Uri.parse("$serverUrl/posts"),
      headers: {'Content-type': 'application/json'},
      // Pass the constructed body to the server
      body: json.encode(newPost),
    );
  }
}
