import 'package:flutter/foundation.dart';
import 'package:spellbook/data_models/spell_model.dart';
import '';

class SpellListData extends ChangeNotifier {

  List<Spell> _selectedSpells = [];

  List<Spell> get selectedSpells => _selectedSpells;

  void addSpell(Spell spell) {
    _selectedSpells.add(spell);
    notifyListeners();
  }

  void removeSpell(int index) {
    _selectedSpells.removeAt(index);
    notifyListeners();
  }
}