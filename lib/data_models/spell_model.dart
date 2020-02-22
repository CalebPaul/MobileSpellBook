class Spell {
  String castingTime;
  List<String> classes;
  Components components;
  String description;
  String duration;
  String higherLevels;
  String level;
  String name;
  String range;
  bool ritual;
  String school;
  List<String> tags;
  String type;

  Spell(
      {this.castingTime,
      this.classes,
      this.components,
      this.description,
      this.duration,
      this.higherLevels,
      this.level,
      this.name,
      this.range,
      this.ritual,
      this.school,
      this.tags,
      this.type});

  Spell.fromJson(Map<String, dynamic> json) {
    castingTime = json['casting_time'];
    classes = json['classes'].cast<String>();
    components = json['components'] != null
        ? new Components.fromJson(json['components'])
        : null;
    description = json['description'];
    duration = json['duration'];
    higherLevels = json['higher_levels'];
    level = json['level'];
    name = json['name'];
    range = json['range'];
    ritual = json['ritual'];
    school = json['school'];
    tags = json['tags'].cast<String>();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['casting_time'] = this.castingTime;
    data['classes'] = this.classes;
    if (this.components != null) {
      data['components'] = this.components.toJson();
    }
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['higher_levels'] = this.higherLevels;
    data['level'] = this.level;
    data['name'] = this.name;
    data['range'] = this.range;
    data['ritual'] = this.ritual;
    data['school'] = this.school;
    data['tags'] = this.tags;
    data['type'] = this.type;
    return data;
  }
}

class Components {
  bool material;
  String raw;
  bool somatic;
  bool verbal;

  Components({this.material, this.raw, this.somatic, this.verbal});

  Components.fromJson(Map<String, dynamic> json) {
    material = json['material'];
    raw = json['raw'];
    somatic = json['somatic'];
    verbal = json['verbal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['material'] = this.material;
    data['raw'] = this.raw;
    data['somatic'] = this.somatic;
    data['verbal'] = this.verbal;
    return data;
  }
}
