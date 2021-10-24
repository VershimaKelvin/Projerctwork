import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mywork/clearance/clearance6.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Clearance5 extends StatefulWidget {
  @override
  _Clearance5State createState() => _Clearance5State();
}

class _Clearance5State extends State<Clearance5> {
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
            'Stage 5',
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  color: Color(0xffF5F5F5),
                  child: ListTile(
                    title: Text('Hostel and sport and Clearance ',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cabin',
                        color: Colors.blue,
                      ),
                    ),
                    subtitle:Text('Take your fee clearance Card to Student affairs for hostel and Sport Clearance',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Cabin',
                        color: Color(0xff424242),
                      ),
                    ),
                    trailing: FlatButton(
                      color: Colors.blue,
                      onPressed: ()async{
                        final prefs2 = await SharedPreferences.getInstance();
                        prefs2.setInt('counter2', 5);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Clearance6()));
                      },
                      child:Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cabin',
                          color: Colors.white,
                        ),
                      ),),
                  ),
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight*0.7,
                child: GoogleMap(
                  myLocationEnabled: true,
                  markers: _makers,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(4.927873,8.330530),
                    zoom: 17,
                  ),
                  onMapCreated: (GoogleMapController controller){
                    setState(() {
                      _makers.add(
                          Marker(
                              markerId: MarkerId('clearance5'),
                              position:LatLng(4.929331,8.331371),
                              infoWindow: InfoWindow(
                                title: 'Student Affairs',
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
}
