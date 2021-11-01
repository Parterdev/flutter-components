import 'package:flutter/material.dart';
import 'dart:async';

class ListPage extends StatefulWidget {
  const ListPage({ Key? key }) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  //Scroll controller
  ScrollController _scrollController = new ScrollController();

  //List information
  List<int> _numbersList = [];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addMoreTenImages();

    _scrollController.addListener(() { 
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _fetchData();
        //_addMoreTenImages();
      }
      //print('Scroll moved');
    });
  }

  //Trigger this dispose when page does not exist on Stack screen
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lists')
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getPaginatedData,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numbersList.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _numbersList[index];
          //print(image);
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/id/$image/500/400'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future getPaginatedData() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _numbersList.clear();
      _addMoreTenImages();
    });

    return Future.delayed(duration);
  }

  _addMoreTenImages() {
    for(var i=1; i<=10; i++) {
      _lastItem++;
      //print(_lastItem);
      _numbersList.add(_lastItem);
    }

    setState(() {});
  }

  Future<Timer> _fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    return new Timer(duration, httpResponse);
  }

  void httpResponse() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.easeInCubic,
      duration: Duration(milliseconds: 250)
    );

    _addMoreTenImages();
  }

  Widget _createLoading() {
    if(_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ 
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 10.0)
        ],
      );
    }else {
      return Container();
    }
  }



}