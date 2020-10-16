import 'dart:convert';
import 'dart:io';

import 'package:app_without_name/models/emergency.dart';
import 'package:app_without_name/utils/database.dart';
import 'package:app_without_name/widgets/gradient_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CreateItemScreen extends StatefulWidget {
  @override
  _CreateItemScreenState createState() => new _CreateItemScreenState();
}

class _CreateItemScreenState extends State<CreateItemScreen>{
  File imageFile = null;
  List<File> listImage = [];
  List<String> listImageName = [];
  var lat, lon;
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();


  @override
  void initState() {
    super.initState();
    getCoordinates();
  }

  @override
  Widget build(BuildContext context) {

    int _currentSlide = 0;
    int typeEmergency = 0;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 150,
                        viewportFraction: 1.0,
                        aspectRatio: 2.0,
                        autoPlay: false,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason){
                          setState(() {
                            _currentSlide = index;
                          });
                        },
                      ),
                      items: listImage.isEmpty?[]:listImage.map((e){
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.black12
                              ),
                              child: Image.file(e),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    GestureDetector(
                      child: Icon(Icons.camera_alt, size: 50, color: Color.alphaBlend(Colors.black12,Colors.white ),),
                      onTap: () async {
                        File img = await ImagePicker.pickImage(
                            source: ImageSource.camera, imageQuality: 90);
                        listImage.add(img);
                        listImageName.add(img.path);
                        setState(() {

                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listImage.map((url) {
                    int index = listImage.indexOf(url);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentSlide == index
                            ? Color.fromRGBO(0, 0, 0, 0.9)
                            : Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 12,),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                SizedBox(height: 12,),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                SizedBox(height: 25,),
                Text("Type emergency"),
                SizedBox(height: 6,),
                ToggleSwitch(
                  minWidth: 90.0,
                  initialLabelIndex: 0,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.black,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.black,
                  labels: ['Attention', 'Dangerous'],
                  activeBgColors: [Colors.yellow, Colors.red],
                  onToggle: (index) {
                    typeEmergency = index;
                  },
                ),
                SizedBox(height: 12,),
                Text("Address"),
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Latitude: $lat; Longitude: $lon"),
                    GestureDetector(
                      child: Icon(Icons.edit),
                      onTap: (){
                        showMap();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 12,),
                RaisedGradientButton(
                  width: double.infinity,
                  height: 50,
                  gradient: LinearGradient(
                      colors: <Color>[Colors.yellowAccent, Colors.redAccent]
                  ),
                  onPressed: (){
                    DBProvider.db.newEmergency(
                        Emergency(
                            name: nameController.text,
                            description: descriptionController.text,
                            type: typeEmergency,
                            coordinates:"$lat;$lon",
                            photo:  jsonEncode(listImageName))
                    );
                    setState(() {

                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("Save", style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getCoordinates() async {

    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    setState(() {
      lat = locationData.latitude;
      lon = locationData.longitude;
    });
  }

  void showMap(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          content: Text("soon"),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: (){

              },
            ),
            FlatButton(
              child: Text("Close"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}

