import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Avatar Page'),
          actions: <Widget>[
            Center(
              child: Container(
                child: Text('Some'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(6),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images-na.ssl-images-amazon.com/images/I/414KJgXRy7L._SX450_.jpg'),
                radius: 30.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 15),
              child: CircleAvatar(
                child: Text('SL'),
                backgroundColor: Colors.indigo,
              ),
            )
          ],
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: FadeInImage(
              image: NetworkImage(
                  'https://i.pinimg.com/originals/8c/ef/d3/8cefd331cea4f0340c9f231afcfdf715.jpg'),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
            ),
          ),
        ));
  }
}
