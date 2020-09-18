import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_without_name/widgets/gradient_button.dart';

import '../constants.dart';

class NewPassScreen extends StatefulWidget {
  @override
  _NewPassScreenState createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {

  bool _passShowed, _newPassShowed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.redAccent,
        ),
        title: Text('New password', style: TextStyle(color: Colors.black54),),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: null,
                decoration: InputDecoration(
                    labelText: 'New password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passShowed ? Icons.visibility : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: (){
                        setState(() {
                          _passShowed = !_passShowed;
                        });
                      },
                    )),
                obscureText: _passShowed,),
              SizedBox(height: 12,),
              TextField(
                controller: null,
                decoration: InputDecoration(
                    labelText: 'Confirm password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _newPassShowed ? Icons.visibility : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: (){
                        setState(() {
                          _newPassShowed = !_newPassShowed;
                        });
                      },
                    )),
                obscureText: _newPassShowed,),
              SizedBox(height: 12,),
              RaisedGradientButton(
                width: double.infinity,
                height: 50,
                gradient: LinearGradient(
                    colors: <Color>[Colors.yellowAccent, Colors.redAccent]
                ),
                onPressed: (){
                  //Navigator.popAndPushNamed(context, LoginViewRoute);
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(LoginViewRoute, (Route<dynamic> route) => false);
                },
                child: Text("Save password", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _passShowed = true;
    _newPassShowed = true;
  }
}