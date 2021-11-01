import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: <Widget>[
          _cardTypeOne(),
          SizedBox(
            height: 30.0,
          ),
          _cardTypeTwo(),
          SizedBox(
            height: 30.0,
          ),
          _cardTypeTwo(),
          SizedBox(
            height: 30.0,
          ),
          _cardTypeTwo(),
          SizedBox(
            height: 30.0,
          ),
          _cardTypeTwo(),
        ],
      ),
    );
  }

  Widget _cardTypeOne() {
    final card = Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('El título de este card'),
            subtitle: Text('Descripción de la tarjeta'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(onPressed: () {}, child: Text('Cancelar')),
              TextButton(onPressed: () {}, child: Text('Ok')),
            ],
          )
        ],
      ),
    );

    return Container(child: card);
  }

  _cardTypeTwo() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            height: 250,
            fit: BoxFit.cover,
            fadeInDuration: Duration(milliseconds: 200),
            placeholder: AssetImage('assets/jar-loading.gif'),
            image:
              NetworkImage('https://wallpaperaccess.com/full/5046024.jpg')),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('No tengo idea de que hay aquí'),
          )
        ],
    ));

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)),
        ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: card,
      ),
    );
  }
}
