import 'package:flutter/material.dart';

import 'Dialog.dart';
import 'ThirdScreen.dart';

class Kitten {
  const Kitten({this.name, this.description, this.age, this.imageUrl});

  final String name;
  final String description;
  final int age;
  final String imageUrl;
}

final String server = 'http://lorempixel.com/400/200/cats/';

final List<Kitten> _kittens = <Kitten>[
  Kitten(
    name: 'Kack',
    description: 'fgfdgdfgdffgfdhghhfjhjyhfdgfdgfdgfdgfdgfdgdfgfdgfdgfdg',
    age: 11,
    imageUrl: server,
  ),
  Kitten(
    name: 'Misthy',
    description: 'fgfdgdfgdffgfdhghhfjhjyhfdgfdgfdgfdgfdgfdgdfgfdgfdgfdg',
    age: 24,
    imageUrl: server,
  ),
  Kitten(
    name: 'Fluffy',
    description: 'fgfdgdfgdffgfdhghhfjhjyhfdgfdgfdgfdgfdgfdgdfgfdgfdgfdg',
    age: 8,
    imageUrl: server,
  ),
  Kitten(
    name: 'Steve',
    description: 'fgfdgdfgdffgfdhghhfjhjyhfdgfdgfdgfdgfdgfdgdfgfdgfdgfdg',
    age: 12,
    imageUrl: server,
  ),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => DialogCustom(_kittens[index]),
      ),
      child: Container (
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        padding: EdgeInsets.only(left: 20.0),
        alignment: Alignment.centerLeft,
        child: Text(
            '${_kittens[0].name} - $index',
            style: Theme.of(context).textTheme.headline
          ),
        )
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaiable Kittens'),
      ),
      body: ListView.builder(
        itemCount: _kittens.length,
        itemExtent: 60.0,
        itemBuilder: _listItemBuilder,
      )
    );
  }
}