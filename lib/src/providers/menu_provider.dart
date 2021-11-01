import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> options = [];

  //Constructor
  _MenuProvider() {
    //loadData();
  }

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(resp);
    //print(dataMap['rutas']);
    options = dataMap['rutas'];

    return options;
  }
}

//Create instance of MenuProvider
final menuProvider = new _MenuProvider();
