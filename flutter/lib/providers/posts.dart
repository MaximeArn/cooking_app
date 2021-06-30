import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:cooking/environment/env.dart';
import 'package:cooking/models/User.dart';
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
      // http.Response response2 = await http.get(Uri.parse("$serverUrl/users/60db8137d1903a2ea01edf50"));
      var author = await User.findById("60db90b6381ea5509765cc48");
      print("author : $author");
      //all might be ok excepting data author field is not a valid User _id. 
      notifyListeners();
    }
  }
}
