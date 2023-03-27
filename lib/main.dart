// import 'package:flutter/material.dart';
// import 'app_colour.dart';
// import 'next.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: Testing(),
//   ));
// }
//
// class Testing extends StatefulWidget {
//
//   Testing({ Key? key}) : super(key: key);
//
//   @override
//   _TestingState createState() => _TestingState();
// }
//
// class _TestingState extends State<Testing> {
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: Appcolour.textnotifier,
//       builder:(context, String textnotifier, child){
//       return ValueListenableBuilder(
//         valueListenable: Appcolour.appcolournotifier,
//         builder: (context, Color appcolournotifier, child) {
//           return Scaffold(
//             backgroundColor: appcolournotifier,
//             appBar: AppBar(),
//             body: Center(
//               child: Column(
//                 children: [
//                   ElevatedButton(
//                     child: Text('Change Color'),
//                     onPressed: () {
//                       Navigator.of(context)
//                           .push(MaterialPageRoute(builder: (context) => ThirdScreen(
//                           title:'2nd Page', color :Colors.lime,
//                           appbar:Colors.black)));
//                     },
//                   ),
//                   Text(textnotifier,style: TextStyle(fontSize: 25),),
//                   // ElevatedButton(
//                   //   child: Text('Change Color'),
//                   //   onPressed: () {
//                   //     Navigator.of(context)
//                   //         .push(MaterialPageRoute(builder: (context) => ThirdScreen(
//                   //         title:'2nd Page', color :Colors.pink,
//                   //         text:'Akshaya',appbar:Colors.black)));
//                   //   },
//                   // ),
//
//                 ],
//               ),
//             ),
//           );
//         },
//       );
//     }, );
//
//   }
// }

import 'package:dum/model/service.dart';
import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'model/model.dart';
import 'model/model.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: FutureBuilder(
            future: service().readJson(),
            builder: (BuildContext context, AsyncSnapshot<CarDetails>snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return CircularProgressIndicator();
              }
              if(snapshot.hasData){
                final showRoom = snapshot.requireData;
                return ListView.builder(
                  itemCount:showRoom.car.length,
                  itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(showRoom.car[index].name),
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder:
                              (context)=>DetailScreen(model: showRoom.car[index].model)));
                    },
                  );
                },);
              }
              return CircularProgressIndicator();

            },
          ))
        ],
      ),
    );
  }
}
