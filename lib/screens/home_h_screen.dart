import 'package:app_without_name/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomeHWidget extends StatelessWidget {

  HomeHWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(25),
              child: Text(HomeScreenAppName,
              style: TextStyle(
                fontSize: 32
              ),),
            )
          ],
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(HomeScreenInstruction,
                style: TextStyle(
                    fontSize: 24
                ),),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(70),
                side: BorderSide(color: Colors.red)
              ),
              color: Colors.white,
              textColor: Colors.red,
              padding: EdgeInsets.all(50),
              onPressed: (){
                Navigator.pushNamed(context, CreateItemRoute);
              },
              child: Icon(FlutterIcons.hand_stop_o_faw),
            )
          ],
        ),
      ],
    );
  }
}