import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_without_name/widgets/gradient_button.dart';

import '../constants.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  int stepCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.redAccent,
        ),
        title: Text('Registration step $stepCount', style: TextStyle(color: Colors.black54),),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.phone,
                controller: null,
                decoration: InputDecoration(
                    labelText: 'Phone number'),),
              SizedBox(height: 12,),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: TextGetCode,
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      style: TextStyle(color: Colors.redAccent),
                      text: "the terms of use",
                      recognizer: TapGestureRecognizer()..onTap = (){
                        Navigator.pushNamed(context, TermsViewRoute);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12,),
              RaisedGradientButton(
                width: double.infinity,
                height: 50,
                gradient: LinearGradient(
                    colors: <Color>[Colors.yellowAccent, Colors.redAccent]
                ),
                onPressed: (){
                  Navigator.pushReplacementNamed(context, NewPassViewRoute);
                },
                child: Text("Get code", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}