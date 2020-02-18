class Spells {
  List<SpellObject> spellObjects;
  String offset;

  Spells({this.spellObjects, this.offset});

  Spells.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      spellObjects = new List<SpellObject>();
      json['records'].forEach((v) {
        spellObjects.add(new SpellObject.fromJson(v));
      });
    }
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.spellObjects != null) {
      data['records'] = this.spellObjects.map((v) => v.toJson()).toList();
    }
    data['offset'] = this.offset;
    return data;
  }
}

class SpellObject {
  String id;
  Fields fields;
  String createdTime;

  SpellObject({this.id, this.fields, this.createdTime});

  SpellObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fields =
        json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
    createdTime = json['createdTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.fields != null) {
      data['fields'] = this.fields.toJson();
    }
    data['createdTime'] = this.createdTime;
    return data;
  }
}

class Fields {
  String spellName;
  String level;
  String school;
  String ritual;
  String castingTime;
  String range;
  String components;
  String verbal;
  String somatic;
  String material;
  String concentration;
  String duration;
  String savingThrow;
  String specialCondition;
  String canUpcast;
  String increasesAtMilestonePCLevels;
  String source1;
  String page;
  String xGtEUpdateToEEPotASpellsSpellList;
  String errataFix;
  String bard;
  String cleric;
  String druid;
  String paladin;
  String ranger;
  String sorcerer;
  String warlock;
  String wizard;
  String materials;

  Fields(
      {this.spellName,
      this.level,
      this.school,
      this.ritual,
      this.castingTime,
      this.range,
      this.components,
      this.verbal,
      this.somatic,
      this.material,
      this.concentration,
      this.duration,
      this.savingThrow,
      this.specialCondition,
      this.canUpcast,
      this.increasesAtMilestonePCLevels,
      this.source1,
      this.page,
      this.xGtEUpdateToEEPotASpellsSpellList,
      this.errataFix,
      this.bard,
      this.cleric,
      this.druid,
      this.paladin,
      this.ranger,
      this.sorcerer,
      this.warlock,
      this.wizard,
      this.materials});

  Fields.fromJson(Map<String, dynamic> json) {
    spellName = json['Spell Name'];
    level = json['Level'];
    school = json['School'];
    ritual = json['Ritual'];
    castingTime = json['Casting Time'];
    range = json['Range'];
    components = json['Components'];
    verbal = json['Verbal'];
    somatic = json['Somatic'];
    material = json['Material'];
    concentration = json['Concentration'];
    duration = json['Duration'];
    savingThrow = json['Saving Throw'];
    specialCondition = json['Special Condition'];
    canUpcast = json['Can Upcast'];
    increasesAtMilestonePCLevels = json['Increases at Milestone PC Levels'];
    source1 = json['Source 1'];
    page = json['Page'];
    xGtEUpdateToEEPotASpellsSpellList =
        json['XGtE Update to EE/PotA Spells/Spell List'];
    errataFix = json['Errata Fix'];
    bard = json['Bard'];
    cleric = json['Cleric'];
    druid = json['Druid'];
    paladin = json['Paladin'];
    ranger = json['Ranger'];
    sorcerer = json['Sorcerer'];
    warlock = json['Warlock'];
    wizard = json['Wizard'];
    materials = json['Materials'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Spell Name'] = this.spellName;
    data['Level'] = this.level;
    data['School'] = this.school;
    data['Ritual'] = this.ritual;
    data['Casting Time'] = this.castingTime;
    data['Range'] = this.range;
    data['Components'] = this.components;
    data['Verbal'] = this.verbal;
    data['Somatic'] = this.somatic;
    data['Material'] = this.material;
    data['Concentration'] = this.concentration;
    data['Duration'] = this.duration;
    data['Saving Throw'] = this.savingThrow;
    data['Special Condition'] = this.specialCondition;
    data['Can Upcast'] = this.canUpcast;
    data['Increases at Milestone PC Levels'] =
        this.increasesAtMilestonePCLevels;
    data['Source 1'] = this.source1;
    data['Page'] = this.page;
    data['XGtE Update to EE/PotA Spells/Spell List'] =
        this.xGtEUpdateToEEPotASpellsSpellList;
    data['Errata Fix'] = this.errataFix;
    data['Bard'] = this.bard;
    data['Cleric'] = this.cleric;
    data['Druid'] = this.druid;
    data['Paladin'] = this.paladin;
    data['Ranger'] = this.ranger;
    data['Sorcerer'] = this.sorcerer;
    data['Warlock'] = this.warlock;
    data['Wizard'] = this.wizard;
    data['Materials'] = this.materials;
    return data;
  }
}
