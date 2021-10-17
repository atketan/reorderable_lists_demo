import 'package:flutter/material.dart';
import 'package:reorderable_lists_demo/presentation/simple_reorderable_list_page.dart';

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
            )
          ],
        ),
      ),
    );
  }
}
