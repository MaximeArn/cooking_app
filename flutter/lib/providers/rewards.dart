import 'dart:collection';
import 'package:http/http.dart' as http;
import 'package:cooking/environment/env.dart';
import 'package:cooking/models/Reward.type.dart';
import 'package:flutter/foundation.dart';

class rewardsProvider with ChangeNotifier {
  List<Reward> _rewards = [];

  UnmodifiableListView<Reward> get rewards => UnmodifiableListView(_rewards);

  Future<void> fetchRewards() async {
    try {
      http.Response response = http.get(Uri.parse('$serverUrl/rewards'));
      if(response.statusCode == 200){
        // transform json data on dart objects 
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}
