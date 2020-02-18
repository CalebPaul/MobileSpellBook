// To parse this JSON data, do
//
//     final spell = spellFromJson(jsonString);
// Use bool x = field.toLowerCase() for system boolean values

import 'dart:convert';

Spell spellFromJson(String str) => Spell.fromJson(json.decode(str));

String spellToJson(Spell data) => json.encode(data.toJson());

class Spell {
  String id;
  Fields fields;
  DateTime createdTime;

  Spell({
    this.id,
    this.fields,
    this.createdTime,
  });

  factory Spell.fromJson(Map<String, dynamic> json) => Spell(
    id: json["id"],
    fields: Fields.fromJson(json["fields"]),
    createdTime: DateTime.parse(json["createdTime"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fields": fields.toJson(),
    "createdTime": createdTime.toIso8601String(),
  };
}

class Fields {
  String spellName;
  String level;
  String school;
  String ritual;
  String castingTime;
  String range;
  String components;
  bool verbal;
  bool somatic;
  bool material;
  bool concentration;
  String duration;
  String savingThrow;
  bool specialCondition;
  bool canUpcast;
  String increasesAtMilestonePcLevels;
  String source1;
  String page;
  String xGtEUpdateToEePotASpellsSpellList;
  bool errataFix;
  bool bard;
  bool cleric;
  bool druid;
  bool paladin;
  bool ranger;
  bool sorcerer;
  bool warlock;
  bool wizard;

  Fields({
    this.spellName,
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
    this.increasesAtMilestonePcLevels,
    this.source1,
    this.page,
    this.xGtEUpdateToEePotASpellsSpellList,
    this.errataFix,
    this.bard,
    this.cleric,
    this.druid,
    this.paladin,
    this.ranger,
    this.sorcerer,
    this.warlock,
    this.wizard,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    spellName: json["Spell Name"],
    level: json["Level"],
    school: json["School"],
    ritual: json["Ritual"],
    castingTime: json["Casting Time"],
    range: json["Range"],
    components: json["Components"],
    verbal: json["Verbal"],
    somatic: json["Somatic"],
    material: json["Material"],
    concentration: json["Concentration"],
    duration: json["Duration"],
    savingThrow: json["Saving Throw"],
    specialCondition: json["Special Condition"],
    canUpcast: json["Can Upcast"],
    increasesAtMilestonePcLevels: json["Increases at Milestone PC Levels"],
    source1: json["Source 1"],
    page: json["Page"],
    xGtEUpdateToEePotASpellsSpellList: json["XGtE Update to EE/PotA Spells/Spell List"],
    errataFix: json["Errata Fix"],
    bard: json["Bard"],
    cleric: json["Cleric"],
    druid: json["Druid"],
    paladin: json["Paladin"],
    ranger: json["Ranger"],
    sorcerer: json["Sorcerer"],
    warlock: json["Warlock"],
    wizard: json["Wizard"],
  );

  Map<String, dynamic> toJson() => {
    "Spell Name": spellName,
    "Level": level,
    "School": school,
    "Ritual": ritual,
    "Casting Time": castingTime,
    "Range": range,
    "Components": components,
    "Verbal": verbal,
    "Somatic": somatic,
    "Material": material,
    "Concentration": concentration,
    "Duration": duration,
    "Saving Throw": savingThrow,
    "Special Condition": specialCondition,
    "Can Upcast": canUpcast,
    "Increases at Milestone PC Levels": increasesAtMilestonePcLevels,
    "Source 1": source1,
    "Page": page,
    "XGtE Update to EE/PotA Spells/Spell List": xGtEUpdateToEePotASpellsSpellList,
    "Errata Fix": errataFix,
    "Bard": bard,
    "Cleric": cleric,
    "Druid": druid,
    "Paladin": paladin,
    "Ranger": ranger,
    "Sorcerer": sorcerer,
    "Warlock": warlock,
    "Wizard": wizard,
  };
}
