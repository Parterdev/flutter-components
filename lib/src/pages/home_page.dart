import 'package:flutter/material.dart';
import 'package:flutter_componentes/src/providers/menu_provider.dart';
import 'package:flutter_componentes/src/utils/icon_string_util.dart';
//import 'package:flutter_componentes/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Components'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    //print(menuProvider.options);

    //Future builder
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        //Builder should return a widget
        return ListView(children: _itemList(snapshot.data, context));
      },
    );
  }

  List<Widget> _itemList(List<dynamic> data, BuildContext context) {
    //Return data
    final List<Widget> options = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
          title: Text(opt['texto']),
          leading: getIcon(opt['icon']),
          trailing: Icon(Icons.arrow_right, color: Colors.blue),
          onTap: () {
            Navigator.pushNamed(context, opt['ruta']);
            /* final route = MaterialPageRoute(builder: (context) => AlertPage());
            Navigator.push(context, route); */
          });
      options..add(widgetTemp)..add(Divider());
    });

    return options;
  }
}
