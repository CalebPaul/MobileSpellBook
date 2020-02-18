import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'package:spellbook/models/spells.dart';

String url =
    'https://api.airtable.com/v0/appBTswdiWZFat1fp/SpellingB?maxRecords=700&view=Grid%20view';
Map<String, String> header = {"Authorization": "Bearer keyZiCYQ71meclPnH"};

List<SpellObject> fullList = [];

Future<List<SpellObject>> getData() async {
  fullList.clear();

  http.Response response = await http.get(url, headers: header);

  log("response status: ${response.statusCode}");
  if (response.statusCode == 200) {
    Map<String, dynamic> dataParentObj = json.decode(response.body);

    var spellRepo = Spells.fromJson(dataParentObj);
    for (var spell in spellRepo.spellObjects) {
      fullList.add(spell);
    }
    log("length of list: ${fullList.length}");
    return fullList;
  }
  return null;
}
