import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:spellbook/data_models/spell_list_data.dart';
import 'package:spellbook/routes/spell_detail_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'app.dart';
import 'data_models/spell_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpellListData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inky\'s Spellbook',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: MyHomePage(title: 'Inky\'s Spellbook'),
      ),
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
  List<Spell> _spells = [];
  List<Spell> _filteredSpells = [];
  bool isSearching = false;
  int _navigationIndex = 0;



  @override
  void initState() {
    _getSpells().then((data) {
      setState(() {
        _spells = _filteredSpells = data;
      });
    });
    super.initState();
  }

  void _filterSpells(value) {
    setState(() {
      _filteredSpells = _spells
          .where((spell) =>
              (spell.name
                  .toLowerCase()
                  .contains(value.toString().toLowerCase())) ||
              (spell.description
                  .toLowerCase()
                  .contains(value.toString().toLowerCase())))
          .toList();
    });
  }

  _getSpells() async {
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

    //spidey sense says this is an anti-pattern, but idk
    var tabs = [
      buildSpellListBody(),
      Center(child: Text("Charts and Graphs: ${Provider.of<SpellListData>(context). selectedSpells.length} spells to analyze")),
      Center(child: Text("Settings")),
    ];

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
                    hintText: 'search spells',
                    hintStyle: AppTextStyles.baseHint),
                onChanged: (value) {
                  _filterSpells(value);
                },
              ),
        actions: <Widget>[
          !isSearching
              ? IconButton(
                  //top right search
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      //toggle search
                      this.isSearching = !this.isSearching;
                    });
                  },
                )
              : IconButton(
                  //top right search
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      //toggle search
                      this.isSearching = !this.isSearching;
                      _filteredSpells = _spells;
                    });
                  },
                ),
        ],
      ),
      body: tabs[_navigationIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: AppTextStyles.listTitle,
        selectedItemColor: Colors.black,
        unselectedLabelStyle: AppTextStyles.listTitle,
        showUnselectedLabels: false,
        currentIndex: _navigationIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text("Spell List"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            title: Text("Charts"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
          ),
        ],
        onTap: (index) {
          setState(() {
            _navigationIndex = index;
          });
        },
      ),
    );
  }

  SafeArea buildSpellListBody() {
    return SafeArea(
      child: _spells.length > 0
          ? ListView.builder(
              itemCount: _filteredSpells.length,
              itemBuilder: (BuildContext context, int index) {
                return buildSpellListItem(_filteredSpells, index, context);
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  //TODO - convey selected status
  Card buildSpellListItem(List<Spell> spells, int index, BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          spells[index].name,
          style: AppTextStyles.listTitle,
        ),
        trailing: Icon(Icons.radio_button_unchecked),
        subtitle: Text(
          "Level: ${spells[index].level}",
          style: AppTextStyles.subtitle,
        ),
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => SpellDetailRoute(spells[index])));
        },
        onLongPress: () {
          Provider.of<SpellListData>(context, listen: false).addSpell(spells[index]);
          Fluttertoast.showToast(msg: "${spells[index].name} added to spell list.", toastLength: Toast.LENGTH_SHORT);
        },
      ),
    );
  }
}
