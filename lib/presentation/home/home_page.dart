import 'package:flutter/material.dart';

import '../firestore_reorderable_list/firestore_reorderable_list.dart';
import '../simple_reorderable_list/simple_reorderable_list_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SimpleReorderableListPage(),
                  ),
                );
              },
              child: Text("Simple Reorderable List"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FirestoreReorderableListPage(),
                  ),
                );
              },
              child: Text("Reorderable List with Firestore"),
            )
          ],
        ),
      ),
    );
  }
}
