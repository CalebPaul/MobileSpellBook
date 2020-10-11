import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spellbook/data_models/spell_list_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:spellbook/data_models/spell_model.dart';

class SpellbookChartRoute extends StatelessWidget {
  SpellbookChartRoute();

  //TODO - add visualization

  @override
  Widget build(BuildContext context) {
    var spells = Provider.of<SpellListData>(context).selectedSpells;
    log("selected list size: ${spells.length}");
    return DonutAutoLabelDamageChart(spells: Provider.of<SpellListData>(context).selectedSpells);
    // return PlaceHolderText(spells: Provider.of<SpellListData>(context).selectedSpells);
  }
}

class DonutAutoLabelDamageChart extends StatelessWidget {
  const DonutAutoLabelDamageChart({
    Key key,
    @required this.spells,
  }) : super(key: key);

  final List<Spell> spells;

  @override
  Widget build(BuildContext context) {
    var data = <DamageType>[];
    spells.forEach((spell) {
      var damType;
      damType = spell.getDamageTypes().first != null ? spell.getDamageTypes().first : "Non-damage spell(s)";
      log("selected spells length: ${spells.length}");
      data.add(
          DamageType(damType, spells.length, Colors.red));
      log("damage types: ${data}");
    });

    var series = [
      charts.Series(
        domainFn: (DamageType damageType, _) => damageType.damageTypes,
        measureFn: (DamageType damageType, _) => damageType.totalSpells,
        id: 'Spells damage idk',
        data: data,
      ),
    ];

    var chart = charts.BarChart(series, animate: true,);

    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    return Center(
      child: chartWidget
    );

  }
}

class PlaceHolderText extends StatelessWidget {
  const PlaceHolderText({
    Key key,
    @required this.spells,
  }) : super(key: key);

  final List<Spell> spells;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('''
      Charts and Graphs: 
      ${spells.length} spells to analyze
      ${spells.where((element) => element.isConcentration()).toList().length} spells are concentration
    '''),
    );
  }
}

class DamageType {
  final String damageTypes;
  final int totalSpells;
  final charts.Color color;

  DamageType(this.damageTypes, this.totalSpells, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
