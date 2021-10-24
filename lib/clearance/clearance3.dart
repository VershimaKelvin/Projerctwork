import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mywork/clearance/clearance4.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Clearance3 extends StatefulWidget {
  @override
  _Clearance3State createState() => _Clearance3State();
}

class _Clearance3State extends State<Clearance3> {
  Set<Marker> _makers = {};
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            'Stage 3',
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
          width: screenWidth,
          height: screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xffF5F5F5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: ListTile(
                    title: Text(
                      'Library Clearance',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cabin',
                        color: Colors.blue,
                      ),
                    ),
                    subtitle: Text(
                      'Take your fee clearance card and library card to the library for library clearance',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Cabin',
                        color: Color(0xff424242),
                      ),
                    ),
                    trailing: FlatButton(
                      color: Colors.blue,
                      onPressed: () async {
                        final prefs2 = await SharedPreferences.getInstance();
                        prefs2.setInt('counter2', 3);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Clearance4(),
                          ),
                        );
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
              Container(
                width: screenWidth,
                height: screenHeight * 0.73,
                child: GoogleMap(
                  myLocationEnabled: true,
                  markers: _makers,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(4.927873, 8.330530),
                    zoom: 17,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    setState(() {
                      _makers.add(Marker(
                          markerId: MarkerId('clearance3'),
                          position: LatLng(4.929731,8.330336),
                          infoWindow: InfoWindow(
                            title: 'School Library',
                          )));
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
