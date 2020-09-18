import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_without_name/constants.dart';
import 'package:app_without_name/widgets/gradient_button.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passShowed;

  @override
  Widget build(BuildContext context) {

    AppBar appBar = AppBar(
      title: Text('LoginScreen', style: TextStyle(color: Colors.black54),),
      backgroundColor: Colors.white,
    );

    double height = MediaQuery.of(context).size.height-appBar.preferredSize.height*2;

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    //filled: true,
                      labelText: 'Username, email, phone'),),
                SizedBox(height: 12,),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: 'Password',
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
                Center(
                  child: FlatButton(
                    onPressed: (){
                      Navigator.pushNamed(context, ResetPassViewRoute);
                    },
                    child: Text("Forgot password", style: TextStyle(color: Colors.redAccent),),
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
                    Navigator.pushReplacementNamed(context, HomeViewRoute);
                  },
                  child: Text("Login", style: TextStyle(color: Colors.white),),
                ),
                SizedBox(height: 12,),
                Row(
                  children: <Widget>[
                    Expanded(child: Padding(padding: EdgeInsets.fromLTRB(0, 0, 5, 0),child: Divider(),)),
                    Text("OR",style: TextStyle(color: Colors.black54),),
                    Expanded(child: Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0),child: Divider(),)),
                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: null,
                      child: new Icon(
                        FlutterIcons.facebook_box_mco,
                        color: Colors.white,
                        size: 35.0,
                      ),
                      shape: new CircleBorder(),
                      elevation: 2.0,
                      fillColor: Colors.blue,
                      padding: const EdgeInsets.all(15.0),
                    ),
                    RawMaterialButton(
                      onPressed: null,
                      child: new Icon(
                        FlutterIcons.google_ant,
                        color: Colors.white,
                        size: 35.0,
                      ),
                      shape: new CircleBorder(),
                      elevation: 2.0,
                      fillColor: Colors.blue,
                      padding: const EdgeInsets.all(15.0),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("You don't have an account?"),
                        FlatButton(
                          onPressed: (){
                            Navigator.pushNamed(context, RegistrationViewRoute);
                          },
                          child: Text("Registration",style: TextStyle(color: Colors.redAccent),),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _passShowed = true;
  }
}