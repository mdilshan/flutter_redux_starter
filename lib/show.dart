import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux1/store/action/payloads/post_payloads.dart';
import 'package:flutter_redux1/store/action/post_actions.dart';

import 'model/AppState.dart';

class ShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Page"),
      ),
      body: StoreConnector<AppState, PostState>(
        onInit: (store) => fetchPostsAction(store),
        converter: (store) => store.state.posts,
        builder: (context, postState) {
          return RefreshIndicator(
            onRefresh: () async {
              //StoreProvider.of(context).dispatch(HardReloadAction());
              return true;
            },
            child: Container(
              height: 300,
              child: postState.allIds == null
                  ? Text('Loading')
                  : ListView.builder(
                      itemCount: postState.allIds.length,
                      itemBuilder: (BuildContext context, int i) {
                        int postKey = postState.allIds[i];
                        String item = postState.byId[postKey].title;
                        return Text("Title : " + item);
                      }),
            ),
          );
        },
      ),
    );
  }
}
