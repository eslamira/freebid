import 'package:flutter/material.dart';
import 'package:freebid/model/categoryModel.dart';

class SearchResult extends SearchDelegate<CategoryModel> {
  final List<CategoryModel> cats;

  SearchResult(List shopsShow) : cats = List<CategoryModel>.from(shopsShow);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Color(0xFF0D475B),
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: theme.textTheme,
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  // just calling buildSuggestions which essentially do nothing new
  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List catsFiltered = query.isEmpty
        ? cats
        : cats
            .where((search) =>
                search.catName.startsWith(RegExp(query, caseSensitive: false)))
            .toList();

    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: ListView.builder(
        itemCount: catsFiltered.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: catsFiltered[index],
          );
        },
      ),
    );
  }
}
