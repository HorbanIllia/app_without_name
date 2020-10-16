import 'package:app_without_name/models/emergency.dart';
import 'package:app_without_name/screens/info_emergency_screen.dart';
import 'package:app_without_name/utils/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyEmergencyHScreen extends StatefulWidget  {

  MyEmergencyHScreen();

  @override
  State<StatefulWidget> createState() {
    return _MyEmergencyHState();
  }
}

class _MyEmergencyHState extends State<MyEmergencyHScreen> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: FutureBuilder<List<Emergency>>(
          future: DBProvider.db.getAllEmergency(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_,position){
                  final item = snapshot.data[position];
                  return Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                        width: 1,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment(-0.7,0),
                        colors: [Colors.white,
                          item.type==0 ? Colors.yellow : Colors.redAccent],
                      ),
                    ),
                    child: ListTile(
                      title: Text(item.name),
                      onTap: () async {
                        await Navigator.push(context, MaterialPageRoute(
                            builder: (context) => InfoEmergencyScreen(item)));
                        setState(() {});
                      },
                    ),
                  );
                },
              );
            } else return Text("data");
          },
        ),
      ),
    );
  }
}