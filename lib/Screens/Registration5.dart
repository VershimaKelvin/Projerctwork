import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mywork/Screens/Registration6.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registration5 extends StatefulWidget {
  @override
  _Registration5State createState() => _Registration5State();
}

class _Registration5State extends State<Registration5> {
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
                    title: Text('Certificate Verification Clearance',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cabin',
                        color: Colors.blue,
                      ),
                    ),
                    subtitle:Text('required documents for CVC are WAEC, NECO and Admission later.',
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
                             final prefs = await SharedPreferences.getInstance();
                          prefs.setInt('counter', 5);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Registration6()));
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
                              markerId: MarkerId('id-1'),
                              position:LatLng(4.927307, 8.331751),
                              infoWindow: InfoWindow(
                                title: 'Education Block',
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
