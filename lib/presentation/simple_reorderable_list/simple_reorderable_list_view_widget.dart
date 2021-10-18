import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SimpleReorderableListViewWidget extends StatefulWidget {
  const SimpleReorderableListViewWidget({
    Key key,
    @required this.index,
    @required this.item,
  }) : super(key: key);

  final int index;
  final String item;

  @override
  _SimpleReorderableListViewWidgetState createState() =>
      _SimpleReorderableListViewWidgetState();
}

class _SimpleReorderableListViewWidgetState
    extends State<SimpleReorderableListViewWidget> {
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
              key: ValueKey("widget_${widget.item}"),
              elevation: 2,
              child: Stack(
                children: [
                  SizedBox(
                    height: 50,
                    child: ListTile(
                      title: Text(widget.item),
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
                            index: widget.index,
                            child: Icon(
                              Icons.more_vert,
                              size: 20,
                              color: Colors.grey[700],
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
                  ),
                ],
              ),
            ),
          )
        : Card(
            key: ValueKey("widget_${widget.item}"),
            color: Colors.white,
            elevation: 2,
            child: SizedBox(
              height: 50,
              child: ListTile(
                title: Text(widget.item),
                leading: Icon(
                  Icons.arrow_right,
                ),
              ),
            ),
          );
  }
}
