import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:github_search_flutter_client_rxdart_example/models/github_search_result.dart';
import 'package:github_search_flutter_client_rxdart_example/services/github_search_api_wrapper.dart';
import 'package:rxdart/rxdart.dart';

enum APIError { rateLimitExceeded }

class GitHubSearchService {
  GitHubSearchService({@required this.apiWrapper}) {
    _results = _searchTerms
        .debounce((_) => TimerStream(true, Duration(milliseconds: 250)))
        .switchMap((query) async* {
      print('searching: $query');
      yield await apiWrapper.searchUser(query);
    });
  }
  final GitHubSearchAPIWrapper apiWrapper;

  final _searchTerms = BehaviorSubject<String>();
  void searchUser(String query) => _searchTerms.add(query);

  Stream<GitHubSearchResult> _results;
  Stream<GitHubSearchResult> get results => _results;

  void dispose() {
    _searchTerms.close();
  }
}
