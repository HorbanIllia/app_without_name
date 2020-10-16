import 'dart:convert';
import 'dart:io';

import 'package:app_without_name/constants.dart';
import 'package:app_without_name/models/emergency.dart';
import 'package:app_without_name/utils/database.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class InfoEmergencyScreen extends StatelessWidget{

  final Emergency emergency;

  InfoEmergencyScreen(this.emergency);

  @override
  Widget build(BuildContext context) {

    List<String> photoAddress = jsonDecode(emergency.photo).cast<String>();

    deleteMessage() {
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            content: Text(DeleteMessage),
            actions: [
              FlatButton(
                child: Text(AnswerYes),
                onPressed: (){
                  DBProvider.db.deleteEmergency(emergency.id);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text(AnswerNo),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  deleteMessage();
                  //Navigator.pop(context);
                },
                child: Icon(
                    Icons.delete
                ),
              )
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              photoAddress.isNotEmpty ? CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 1.0,
                  aspectRatio: 2.0,
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: photoAddress.map((e)=>Container(
                  child: Image.file(File(e)),
                )).toList(),
              ) : SizedBox(
                height: 300,
                child: Center(
                  child: Icon(FlutterIcons.photo_faw,size: 50,),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text("Type", style: TextStyle(color: Colors.black54),),
                    Text(emergency.type==0?"Attention":"Dangerous", style: TextStyle(fontSize: 24),),
                    SizedBox(height: 20,),
                    Text("Name", style: TextStyle(color: Colors.black54),),
                    Text(emergency.name, style: TextStyle(fontSize: 24),),
                    SizedBox(height: 20,),
                    Text("Description", style: TextStyle(color: Colors.black54),),
                    Text(emergency.description, style: TextStyle(fontSize: 20,),textAlign: TextAlign.start,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}