import 'package:flutter/material.dart';
import 'package:spellbook/app.dart';
import 'package:spellbook/data_models/spell_model.dart';

class SpellDetailRoute extends StatelessWidget{

  final Spell spell;

  SpellDetailRoute(this.spell);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(spell.name, style: AppTextStyles.header,)
      ),
      body: Container(
        child: SafeArea(
          child: Center(
            child: Text(spell.description),
          ),
        ),
      ),
    );
  }

}