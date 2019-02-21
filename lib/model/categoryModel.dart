import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CategoryModel extends StatelessWidget {
  final String catName;

  const CategoryModel({Key key, @required this.catName}) : super(key: key);

  CategoryModel.fromSnapshot(DataSnapshot snapshot)
      : catName = snapshot.value == null ? "" : snapshot.value["name"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).padding.left + 10),
      child: ListTile(
        title: Text(
          catName,
          style: TextStyle(
            color: Color(0xFF676767),
            fontSize: 23,
          ),
        ),
        onTap: null,
      ),
    );
  }
}
