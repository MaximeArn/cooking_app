import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cooking/environment/env.dart';
import 'package:cooking/models/Reward.dart';
import 'package:flutter/foundation.dart';

class RewardsProvider with ChangeNotifier {
  List<Reward> _rewards = [];
  bool isLoading = false;

  UnmodifiableListView<Reward> get rewards => UnmodifiableListView(_rewards);

  Future<void> fetchRewards() async {
    isLoading = true;
    try {
      http.Response response = await http.get(Uri.parse('$serverUrl/rewards'));
      if (response.statusCode == 200) {
        List decodedBody = json.decode(response.body);
        _rewards = decodedBody
            .map((jsonReward) => Reward.fromJson(jsonReward))
            .toList();
        notifyListeners();
        isLoading = false;
      }
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }
}
