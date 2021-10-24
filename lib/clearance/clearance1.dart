import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mywork/clearance/clearance2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Clearance1 extends StatefulWidget {
  @override
  _Clearance1State createState() => _Clearance1State();
}

class _Clearance1State extends State<Clearance1> {

  Location location = new Location();
  List<LatLng> polylinesCoordinate = [];
  PolylinePoints polylinePoints;
  Set<Marker> _makers = {};
  bool _serviceEnabled;
  LocationData _currentPosition;
  PermissionStatus _permissionGranted;
  Set<Polyline> _polylines = Set<Polyline>();

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
                      'Faculty clearance',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cabin',
                        color: Colors.blue,
                      ),
                    ),
                    subtitle: Text(
                      'Collect a clearance form from the faulty which will be signed by all labs; Physics, Chemisty, Biology and computer laboratory. \nTake the signed form to the H.O.D to sign then take it back to the faculty',
                      style: TextStyle(
                        fontSize: 11,
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
                        onPressed: () async {
                          final prefs2 = await SharedPreferences.getInstance();
                          prefs2.setInt('counter2', 1);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Clearance2()));
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
                height: screenHeight * 0.67,
                child: GoogleMap(
                  myLocationEnabled: true,
                  markers: _makers,
                  polylines: _polylines,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(4.927873, 8.330530),
                    zoom: 17,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    setState(() {
                      _makers.add(
                        Marker(
                            markerId: MarkerId('clearance1'),
                            position: LatLng(4.929436, 8.330208),
                            infoWindow: InfoWindow(
                              title: 'Faculty of Science',
                            )),
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
}
