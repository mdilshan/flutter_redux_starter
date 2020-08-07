import 'package:flutter_redux1/store/action/payloads/post_payloads.dart';

import './Post.dart';

class AppState {
  final PostState posts;

  AppState(this.posts);

  AppState.init() : posts = new PostState(null, null);
}
