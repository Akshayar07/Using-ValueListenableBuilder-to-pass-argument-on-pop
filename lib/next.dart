
import 'package:dum/app_colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  ThirdScreen({required this.color,required this.title, required this.appbar, Key? key}) : super(key: key);

  String title;
  Color color;
  Color appbar;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      appBar: AppBar(
        backgroundColor: widget.appbar,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text('back'),
                onPressed: () {
                  Appcolour.textnotifier.value="nice";
                  Appcolour.appcolournotifier.value=Colors.white60;
                  Navigator.pop(context);
                },
              ),
            ],
          )
      ),
    );
  }
}



