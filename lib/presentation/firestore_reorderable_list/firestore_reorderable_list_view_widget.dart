import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FirestoreReorderableListViewWidget extends StatefulWidget {
  final String title;
  final int pos;

  const FirestoreReorderableListViewWidget({Key key, this.title, this.pos})
      : super(key: key);

  @override
  _FirestoreReorderableListViewWidgetState createState() =>
      _FirestoreReorderableListViewWidgetState();
}

class _FirestoreReorderableListViewWidgetState
    extends State<FirestoreReorderableListViewWidget> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? MouseRegion(
            onEnter: (event) {
              setState(() {
                _isHover = true;
              });
            },
            onHover: (event) {
              setState(() {
                _isHover = true;
              });
            },
            onExit: (event) {
              setState(() {
                _isHover = false;
              });
            },
            child: Card(
              color: Colors.white,
              elevation: 2,
              child: Stack(
                children: [
                  SizedBox(
                    height: 50,
                    child: ListTile(
                      title: Text(widget.title),
                      leading: Icon(
                        Icons.arrow_right,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _isHover,
                    child: Container(
                      color: Colors.white70,
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReorderableDragStartListener(
                            index: widget.pos,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.move,
                              child: Icon(
                                Icons.more_vert,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : Card(
            color: Colors.white,
            elevation: 2,
            child: SizedBox(
              height: 50,
              child: ListTile(
                title: Text(widget.title),
                leading: Icon(
                  Icons.arrow_right,
                ),
              ),
            ),
          );
  }
}
