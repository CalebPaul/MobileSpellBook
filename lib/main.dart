import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:spellbook/routes/spell_detail_route.dart';
import 'app.dart';
import 'data_models/spell_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inky\'s Spellbook',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'Inky\'s Spellbook'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Spell>> _futureSpells;
  bool isSearching = false;

  @override
  void initState() {
    _futureSpells = _getSpells();
    super.initState();
  }

  void _filterSpells(value) {
    print(value);
  }

  Future<List<Spell>> _getSpells() async {
    var list = new List<Spell>();

    var rawString = await rootBundle.loadString('assets/spells.json');
    var jsonString = json.decode(rawString);

    for (var spell in jsonString) {
      list.add(Spell.fromJson(spell));
    }
    log("spells: ${list.length}");

    //sort alphabetically by spell name
    list.sort((a, b) => a.name.compareTo(b.name));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isSearching
            ? Center(
                child: Text(
                  widget.title,
                  style: AppTextStyles.header1,
                ),
              )
            : TextField(
                decoration: InputDecoration(
                  //left search
                  icon: Icon(Icons.search),
                  hintText: 'Search Spells',
                ),
          onChanged: (value) {
                  _filterSpells(value);
          },
              ),
        actions: <Widget>[
          !isSearching ? IconButton(
            //top right search
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                //toggle search
                this.isSearching = !this.isSearching;
              });
            },
          ) :
          IconButton(
            //top right search
            icon: Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                //toggle search
                this.isSearching = !this.isSearching;
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: _futureSpells,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return buildSpellListItem(snapshot, index, context);
              },
            );
          },
        ),
      ),
    );
  }

  Card buildSpellListItem(
      AsyncSnapshot snapshot, int index, BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          snapshot.data[index].name,
          style: AppTextStyles.listTitle,
        ),
        trailing: Icon(Icons.more_vert),
        subtitle: Text(
          "Level: ${snapshot.data[index].level}",
          style: AppTextStyles.subtitle,
        ),
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) =>
                      SpellDetailRoute(snapshot.data[index] as Spell)));
        },
        onLongPress: () {},
      ),
    );
  }
}
