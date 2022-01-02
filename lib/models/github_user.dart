import 'dart:html';

import 'package:flutter/foundation.dart';

// TODO: Convert to use freezed
class GitHubUser {
  GitHubUser(
      {@required this.login,
      @required this.avatarUrl,
      @required this.htmlUrl,
      List<String> Url});

  final String login;
  final String avatarUrl;
  final String htmlUrl;

  factory GitHubUser.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    final login = json['login'];
    if (login != null) {
      final avatarUrl = json['avatar_url'];
      final htmlUrl = json['html_url'];
      return GitHubUser(
        login: login,
        avatarUrl: avatarUrl,
        htmlUrl: htmlUrl,
      );
    }
    return null;
  }

  /* Sample response data for a given user
  {
  "total_count": 1,
  "incomplete_results": false,
  "items": [
    {
      "login": "mrjulianto",
      "id": 96938282,
      "node_id": "U_kgDOBccpKg",
      "avatar_url": "https://avatars.githubusercontent.com/u/96938282?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/mrjulianto",
      "html_url": "https://github.com/mrjulianto",
      "followers_url": "https://api.github.com/users/mrjulianto/followers",
      "following_url": "https://api.github.com/users/mrjulianto/following{/other_user}",
      "gists_url": "https://api.github.com/users/mrjulianto/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/mrjulianto/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/mrjulianto/subscriptions",
      "organizations_url": "https://api.github.com/users/mrjulianto/orgs",
      "repos_url": "https://api.github.com/users/mrjulianto/repos",
      "events_url": "https://api.github.com/users/mrjulianto/events{/privacy}",
      "received_events_url": "https://api.github.com/users/mrjulianto/received_events",
      "type": "User",
      "site_admin": false,
      "score": 1.0
    }
  ]
}
    */

  @override
  String toString() => 'username: $login';
}
