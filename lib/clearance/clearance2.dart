
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mywork/clearance/clearance3.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Clearance2 extends StatefulWidget {
  @override
  _Clearance2State createState() => _Clearance2State();
}

class _Clearance2State extends State<Clearance2> {
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
            'Stage 2',
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
                      'Departmental Clearance',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cabin',
                        color: Colors.blue,
                      ),
                    ),
                    subtitle: Text(
                      'Take all your departmental, faculty and S.U.G receipt to the department for departmental clearance ',
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
                        prefs2.setInt('counter2', 2);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Clearance3()));
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
                height: screenHeight * 0.67,
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
                          markerId: MarkerId('clearance2'),
                          position: LatLng(4.924895, 8.329027),
                          infoWindow: InfoWindow(
                            title: 'New Science Block',
                          )));
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
