import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'config.dart';
import 'Helpers.dart';

class TopicSearchDelegate extends SearchDelegate<List> {

  List _data;
  Config _config;
  String abbreviations;

  TopicSearchDelegate(BuildContext context, this._data, this._config) {
    this.abbreviations = _config.abbreviations;
  }

  Future _fetch(BuildContext context, String searchItem) async {
    final Database db = await SqliteHelper(_config).initToolsDb();
    var statement = "SELECT Tool, Entry, Topic FROM EXLBT WHERE Topic LIKE ?";
    List<Map> tools = await db.rawQuery(statement, ['%$searchItem%']);
    db.close();
    _data = distinctMapList(tools);
    showSuggestions(context);
  }

  List<Map> distinctMapList(List<Map> mapList) {
    List<String> entries = <String>[];
    List<Map> filteredMapList = <Map>[];
    for (var tool in mapList) {
      String entry = tool["Entry"];
      if (!(entries.contains(entry))) {
        entries.add(entry);
        filteredMapList.add(tool);
      }
    }
    return filteredMapList;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  // Function triggered when "ENTER" is pressed.
  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) _fetch(context, query);
    return _buildItems(context);
  }

  // Results are displayed if _data is not empty.
  // Display of results changes as users type something in the search field.
  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildItems(context);
  }

  Widget _buildItems(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _data.length,
        itemBuilder: (context, i) {
          return _buildItemRow(i, context);
        });
  }

  Widget _buildItemRow(int i, BuildContext context) {
    var itemData = _data[i];

    return ListTile(
      leading: Icon(Icons.title),
      title: Text(itemData["Topic"], style: _config.verseTextStyle["verseFont"]),
      subtitle: Text(itemData["Tool"], style: TextStyle(fontSize: (_config.fontSize - 5))),

      onTap: () {
        close(context, [itemData["Entry"]]);
      },

    );
  }

}
