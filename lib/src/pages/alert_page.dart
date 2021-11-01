import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar alerta'),
          onPressed: () => _showAlert(context),
          style: ElevatedButton.styleFrom(
              primary: Colors.blue, shape: StadiumBorder()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () => {Navigator.pop(context)},
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Este es el contenido de un grandioso alert mobile'),
                FlutterLogo(
                  size: 100.0,
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK')
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancelar')
              ),
            ],
          );
        });
  }
}
