import 'package:flutter/material.dart';

import 'app_colour.dart';
import 'next.dart';

void main() {
  runApp(MaterialApp(
    home: Testing(),
  ));
}

class Testing extends StatefulWidget {

  Testing({ Key? key}) : super(key: key);



  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Appcolour.textnotifier,
      builder:(context, String textnotifier, child){
      return ValueListenableBuilder(
        valueListenable: Appcolour.appcolournotifier,
        builder: (context, Color appcolournotifier, child) {
          return Scaffold(
            backgroundColor: appcolournotifier,
            appBar: AppBar(),
            body: Center(
              child: Column(
                children: [
                  ElevatedButton(
                    child: Text('Change Color'),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => ThirdScreen(
                          title:'2nd Page', color :Colors.lime,
                          appbar:Colors.black)));
                    },
                  ),
                  Text(textnotifier,style: TextStyle(fontSize: 25),),
                  // ElevatedButton(
                  //   child: Text('Change Color'),
                  //   onPressed: () {
                  //     Navigator.of(context)
                  //         .push(MaterialPageRoute(builder: (context) => ThirdScreen(
                  //         title:'2nd Page', color :Colors.pink,
                  //         text:'Akshaya',appbar:Colors.black)));
                  //   },
                  // ),

                ],
              ),
            ),
          );
        },
      );
    }, );

  }
}
