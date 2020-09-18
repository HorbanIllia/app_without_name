import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class TermsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.redAccent,
        ),
        title: Text('Terms of use', style: TextStyle(color: Colors.black54),),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Text(TextTerms),
      ),
    );
  }
}