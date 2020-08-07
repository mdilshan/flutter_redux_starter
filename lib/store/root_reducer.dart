import 'package:flutter_redux1/model/AppState.dart';
import 'package:flutter_redux1/store/reducers/post_reducer.dart';

AppState rootReducer(AppState state, action) {
  return AppState(
    postReducer(state.posts, action),
    // Other reducers in our app
  );
}
