import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mywork/Screens/Registration2.dart';

class Registration1 extends StatefulWidget {
  @override
  _Registration1State createState() => _Registration1State();
}

class _Registration1State extends State<Registration1> {
  Set<Polyline> _polylines = Set<Polyline>();

  Location location = new Location();
  List<LatLng> polylinesCoordinate = [];
  PolylinePoints polylinePoints;
  Set<Marker> _makers = {};
  bool _serviceEnabled;
  LocationData _currentPosition;
  PermissionStatus _permissionGranted;

  @override
  void initState() {
    super.initState();
    getUserLocation();
    polylinePoints = PolylinePoints();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            'Stage 1',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Cabin',
              color: Color(0xffE0F7FA),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          // width: screenWidth,
          // height: screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: Color(0xffF5F5F5),
                  child: ListTile(
                    title: Text(
                      'Pay Acceptance fee',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cabin',
                        color: Colors.blue,
                      ),
                    ),
                    subtitle: Text(
                      'You have to pay your acceptance fee, 150000 naira at CRUTECH Micro finance bank',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Cabin',
                        color: Color(0xff424242),
                      ),
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registration2()));
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cabin',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight * 0.72,
                child: GoogleMap(
                  myLocationEnabled: true,
                  markers: _makers,
                  polylines: _polylines,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(4.927873, 8.330530),
                    zoom: 15,
                  ),
                  onMapCreated: (GoogleMapController controller){
                    setPolyLines();
                    setState(() {
                      _makers.add(
                        Marker(
                            markerId: MarkerId('id-1'),
                            position:LatLng(4.927873, 8.330530),
                            infoWindow: InfoWindow(
                            title: 'MicroFinace Bank',
                            snippet: 'pay acceptance fee here'
                          )
                        )
                      );
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void setPolyLines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyDJwR_Z24e_f8fa3hIP3FIRa3HsxJKGaXs",
        PointLatLng(_currentPosition.latitude, _currentPosition.longitude),
        PointLatLng(4.947792, 8.324729));
  }

  void getUserLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    _permissionGranted = await location.hasPermission();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();
    LatLng initialCameraPosition =
        LatLng(_currentPosition.latitude, _currentPosition.longitude);
    print("${_currentPosition.longitude}:${_currentPosition.latitude}");

    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _currentPosition = currentLocation;
        initialCameraPosition =
            LatLng(_currentPosition.latitude, _currentPosition.longitude);
      });
    });
  }
}
