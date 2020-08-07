import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux1/model/AppState.dart';
import 'package:flutter_redux1/show.dart';
import 'package:flutter_redux1/store/root_reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Store store = Store<AppState>(rootReducer,
      initialState: AppState.init(), middleware: [thunkMiddleware]);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    //StoreProvider.of<AppState>(context).dispatch(fetchPost);
    print("Work");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            child: Text('Show'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShowPage()),
              );
            },
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
