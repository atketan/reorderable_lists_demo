import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'simple_reorderable_list_view_widget.dart';

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
        title: Text(
          "Reorderable ListView In Flutter",
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
                SimpleReorderableListViewWidget(
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


