import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mywork/Screens/Home.dart';

class Registration6 extends StatefulWidget {
  @override
  _Registration6State createState() => _Registration6State();
}

class _Registration6State extends State<Registration6> {
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
            'Final stage',
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
                    title: Text('Medicals',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cabin',
                        color: Colors.blue,
                      ),
                    ),
                    subtitle:Text(
                      'This is the final stage of your Registration, you need to get your medicals done at the schools clinic',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Cabin',
                        color: Color(0xff424242),
                      ),
                    ),
                    trailing: FlatButton(
                      color: Colors.blue,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                      },
                      child:Text(
                        'Finish',
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
                              position:LatLng(4.926288, 8.332270),
                              infoWindow: InfoWindow(
                                title: 'Medical Center',
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
