import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'firestore_reorderable_list_view_widget.dart';
import 'reorderable_firebase_list.dart';

class FirestoreReorderableListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirestoreReorderableListPageState();
}

class _FirestoreReorderableListPageState
    extends State<FirestoreReorderableListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text(
          "Reorderable ListView with Firestore",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 350,
          ),
          child: ReorderableFirebaseList(
            collection: FirebaseFirestore.instance.collection('items'),
            indexKey: 'pos',
            itemBuilder:
                (BuildContext context, int index, DocumentSnapshot doc) {
              return FirestoreReorderableListViewWidget(
                key: Key(doc.id),
                title: doc.get('title'),
                pos: doc.get('pos'),
              );
            },
          ),
        ),
      ),
    );
  }
}
