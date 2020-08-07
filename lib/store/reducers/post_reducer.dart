import 'package:flutter_redux1/store/action/action_types.dart';
import 'package:flutter_redux1/store/action/payloads/post_payloads.dart';
import 'package:redux/redux.dart';

PostState postEntity(PostState state, action) {
  if (action.type == PostActionTypes.INIT) {
    PostState st = new PostState.copy(state);
    st.byId.addAll(action.post.byId);
    st.allIds.addAll(action.post.allIds);
    return st;
  } else if (action.type == PostActionTypes.HARD_RELOAD) {
    //return []..addAll(action.post);
    return state;
  } else if (action.type == PostActionTypes.DELETE) {
    // todo - write logic for remove post from state
    return state;
  } else if (action.type == PostActionTypes.UPDATE) {
    // todo - write logic for update post from state
    return state;
  } else {
    return state;
  }
}

// List<Comment> commentAction() {

// }

final Reducer<PostState> postReducer = combineReducers([
  postEntity,
  //.... other reducers
]);
