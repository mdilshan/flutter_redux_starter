import 'package:flutter_redux1/model/AppState.dart';
import 'package:flutter_redux1/store/action/action_types.dart';
import 'package:flutter_redux1/store/action/payloads/post_payloads.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/Post.dart';

ThunkAction<AppState> fetchPostsAction = (Store<AppState> store) async {
  http.Response res = await http.get(
    Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
  );

  dynamic result = json.decode(res.body);

  Map<int, Post> posts = new Map<int, Post>();
  List<int> allIds = [];

  result.forEach((element) {
    print(element.id);
    Post post = Post.fromJson(element);
    posts[post.id] = Post.fromJson(element);
    allIds.add(element.id);
  });

  PostState state = new PostState(posts, allIds);

  store.dispatch(new AddPostAction(state, PostActionTypes.INIT));
};
