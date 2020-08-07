import 'package:flutter_redux1/model/Post.dart';

class PostState {
  Map<int, Post> byId;
  List<int> allIds;

  PostState(this.byId, this.allIds);

  PostState.copy(PostState st) {
    byId.addAll(st.byId);
    allIds.addAll(st.allIds);
  }
}

class AddPostAction {
  final PostState post;
  final type;
  AddPostAction(this.post, this.type);
}
