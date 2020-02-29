import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:spellbook/routes/spell_detail_route.dart';
import 'dart:developer';
import 'data_models/spell_model.dart';
import 'app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        title: Text(
          widget.title,
          style: AppTextStyles.header,
        ),
      ),
      body: Container(
          child: FutureBuilder(
        future: _getSpells(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return buildSpellListItem(snapshot, index, context);
            },
          );
        },
      )),
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
      ),
    );
  }
}
