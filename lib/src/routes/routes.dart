import 'package:flutter/material.dart';
import 'package:flutter_componentes/src/pages/alert_page.dart';
import 'package:flutter_componentes/src/pages/animated_container.dart';
import 'package:flutter_componentes/src/pages/avatar_page.dart';
import 'package:flutter_componentes/src/pages/card_page.dart';
import 'package:flutter_componentes/src/pages/home_page.dart';
import 'package:flutter_componentes/src/pages/inputs_page.dart';
import 'package:flutter_componentes/src/pages/listview_page.dart';
import 'package:flutter_componentes/src/pages/slider_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputsPage(),
    'sliders': (BuildContext context) => SliderPage(),
    'lists': (BuildContext context) => ListPage(),
  };
}
