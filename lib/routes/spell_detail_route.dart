import 'package:flutter/material.dart';
import 'package:spellbook/app.dart';
import 'package:spellbook/data_models/spell_model.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpellDetailRoute extends StatelessWidget {
  final Spell spell;
  final Widget svg = SvgPicture.asset('beaker.svg');

  SpellDetailRoute(this.spell);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        spell.name,
        style: AppTextStyles.header,
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ...spell.buildDamageSvgPicture(),
                  ],
                ),
                Text(
                  spell.description,
                  style: AppTextStyles.subtitle,
                ),
                SizedBox(height: 10),
                Text(
                  spell.getDamageTypes().toString(),
                  style: AppTextStyles.listTitle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}
