import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spellbook/app.dart';
import 'package:spellbook/data_models/spell_model.dart';

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
          style: AppTextStyles.header1,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                          child: buildSpellDetailRichText(
                              "Level ${spell.level} ${spell.school} ",
                              "${spell.classes}")),
                    ],
                  ),
                  buildHorizontalSizedBox(),
                  buildHorizontalSizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildSpellDetailRichText(
                          "Cast Time: ", spell.castingTime),
                      buildSpellDetailRichText("Range: ", spell.range),
                    ],
                  ),
                  buildHorizontalSizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildSpellDetailRichText("Duration: ", spell.duration),
                      buildSpellDetailRichText(
                          "Components: ", spell.components.raw),
                    ],
                  ),
                  buildHorizontalDividerAboveSvg(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ...spell.buildDamageSvgPicture(),
                    ],
                  ),
                  buildHorizontalDivider(),
                  buildHorizontalSizedBox(),
                  Text(
                    "Description",
                    style: AppTextStyles.header1,
                  ),
                  buildHorizontalSizedBox(),
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Text(
                        spell.description,
                        style: AppTextStyles.base,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildSpellSingleDetailRichText(String string) {
    return Expanded(
      child: RichText(
        text: TextSpan(
          style: AppTextStyles.base,
          children: <TextSpan>[
            TextSpan(text: string, style: AppTextStyles.baseBold),
          ],
        ),
      ),
    );
  }

  Expanded buildSpellDetailRichText(String key, String value) {
    return Expanded(
      child: RichText(
        text: TextSpan(
          style: AppTextStyles.base,
          children: <TextSpan>[
            TextSpan(text: key, style: AppTextStyles.baseBold),
            TextSpan(text: value)
          ],
        ),
      ),
    );
  }

  SizedBox buildHorizontalSizedBox() => SizedBox(height: 10.0);

  SizedBox buildHorizontalDivider() {
    return SizedBox(
      height: 20.0,
      width: 200.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Divider(color: Colors.yellow),
      ),
    );
  }

  SizedBox buildHorizontalDividerAboveSvg() {
    if (spell.getDamageTypes().length == 0) {
      return SizedBox();
    } else {
      return SizedBox(
        height: 20.0,
        width: 200.0,
        child: Divider(color: Colors.yellow),
      );
    }
  }
}
