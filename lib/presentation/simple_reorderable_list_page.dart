import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SimpleReorderableListPage extends StatefulWidget {
  List<String> item = [
    "Clients",
    "Designer",
    "Developer",
    "Director",
    "Employee",
    "Manager",
    "Worker",
    "Owner"
  ];

  @override
  _SimpleReorderableListPageState createState() =>
      _SimpleReorderableListPageState();
}

class _SimpleReorderableListPageState extends State<SimpleReorderableListPage> {
  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = widget.item.removeAt(oldindex);
      widget.item.insert(newindex, items);
    });
  }

  void sorting() {
    setState(() {
      widget.item.sort();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Reorderable ListView In Flutter",
          style: TextStyle(color: Colors.pinkAccent[100]),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.sort_by_alpha),
              tooltip: "Sort",
              onPressed: sorting),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 350),
          child: ReorderableListView(
            buildDefaultDragHandles: !kIsWeb,
            children: <Widget>[
              for (int index = 0; index < widget.item.length; index++)
                ReorderableListViewWidget(
                    key: ValueKey("list_item_$index"),
                    index: index,
                    item: widget.item[index]),
            ],
            onReorder: reorderData,
          ),
        ),
      ),
    );
  }
}

class ReorderableListViewWidget extends StatefulWidget {
  const ReorderableListViewWidget({
    Key key,
    @required this.index,
    @required this.item,
  }) : super(key: key);

  final int index;
  final String item;

  @override
  _ReorderableListViewWidgetState createState() =>
      _ReorderableListViewWidgetState();
}

class _ReorderableListViewWidgetState extends State<ReorderableListViewWidget> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
                  Icons.work,
                  color: Colors.black,
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
            )
          ],
        ),
      ),
    );
  }
}
