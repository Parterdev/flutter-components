import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temp'),
      ),
      body: ListView(children: _createShortItems()),
    );
  }

  //Return widget list (option1)
  List<Widget> _createItems() {
    List<Widget> list = [];

    for (String opt in options) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      list..add(tempWidget)..add(Divider());
    }

    return list;
  }

  //Option2
  List<Widget> _createShortItems() {
    return options.map((item) {
      return Column(
        children: [
          ListTile(
              title: Text(item + '!'),
              subtitle: Text('Culaquier cosa'),
              leading: Icon(Icons.ac_unit),
              trailing: Icon(Icons.arrow_right),
              onTap: () {}),
          Divider(),
        ],
      );
    }).toList();
  }
}
