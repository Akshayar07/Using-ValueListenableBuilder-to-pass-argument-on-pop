
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/model.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.model}) : super(key: key);

  List<Model> model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: model.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white70,
            child: ListTile(
              title: Text(
                  model[index].colour
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => AmountScreen(
                          price:model[index].price,
                        )));
              },
            ),
          );
        },
      ),
    );
  }
}

class AmountScreen extends StatelessWidget {
  AmountScreen({Key? key, required this.price}) : super(key: key);

  List<Price>price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: price.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white70,
            child: ListTile(
              title: Text(price[index].amount.toString()),
            ),
          );
        },
      ),
    );
  }
}
