import 'package:flutter/material.dart';
import 'package:spellbook/data_models/spell_model.dart';

class SpellDetailRoute extends StatelessWidget{

  final Spell spell;

  SpellDetailRoute(this.spell);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(spell.name)
      ),
      body: Container(
        child: Center(
          child: Text('nothing here yet.'),
        ),
      ),
    );
  }

}