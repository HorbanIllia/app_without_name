import 'package:app_without_name/models/emergency.dart';
import 'package:app_without_name/utils/database.dart';
import 'package:app_without_name/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapHScreen extends StatefulWidget {

  MapHScreen();

  @override
  _MapHScreenState createState() => _MapHScreenState();
}

class _MapHScreenState extends State<MapHScreen> {
  GoogleMapController mapController;
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  LatLng center;


  @override
  void initState() {
    super.initState();
    getCenter();
  }

  getCenter() async{
    LocationData locData = await Utils().getCoordinates();
    setState(() {
      center = LatLng(locData.latitude,locData.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {

    Map<int, Marker> markers = {};

    return FutureBuilder<List<Emergency>>(
      future: DBProvider.db.getAllEmergency(),
      builder: (_, snapshot){
        markers.clear();
        for(final emergency in snapshot.data){
          final marker = Marker(
            markerId: MarkerId(emergency.id.toString()),
            position: LatLng(double.parse(emergency.coordinates.split(";")[0]),
                double.parse(emergency.coordinates.split(";")[1])),
            infoWindow: InfoWindow(
              title: emergency.name,
              snippet: emergency.description,
            ),
          );
          markers[emergency.id] = marker;
        }
        return GoogleMap(
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(
            target: center,
            zoom: 11.0,
          ),
          markers: markers.values.toSet(),
        );
      },
    );
  }
}