import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_without_name/widgets/gradient_button.dart';

import '../constants.dart';

class ResetPassScreen extends StatefulWidget {
  @override
  _ResetPassScreenState createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.redAccent,
        ),
        title: Text('Reset password', style: TextStyle(color: Colors.black54),),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: null,
                decoration: InputDecoration(
                    labelText: 'E-mail'),),
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
                child: Text("Send new password", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}