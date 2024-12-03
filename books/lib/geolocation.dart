import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationSecreen extends StatefulWidget {
  const LocationSecreen({super.key});

  @override
  State<LocationSecreen> createState() => _LocationSecreenState();
}

class _LocationSecreenState extends State<LocationSecreen> {
  Future<Position>? position;

  String myPosition = '';
  @override
  void initState() {
    super.initState();
    position = getPosition();
    getPosition().then((Position myPos) {
      myPosition =
          'Latitude: ${myPos.latitude.toString()} - Longitude: ${myPos.longitude.toString()}';
      setState(() {
        myPosition = myPosition;
      });
    });
  }
// @override
//   Widget build(BuildContext context) {
//     final myWidget = myPosition == ''
//         ? const CircularProgressIndicator()
//         : Text(myPosition);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Wulansari')),
//       body: Center(child: myWidget),
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('lokasi saat ini')),
      body: Center(child: FutureBuilder(
        future: position, 
        builder: (BuildContext context, AsyncSnapshot<Position>
        snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          else if (snapshot.connectionState == ConnectionState.done) {
            return Text(snapshot.data.toString());
          }
          else {
            return const Text('');
          }
        },
      ),
      ));
  }
  
  Future<Position> getPosition() async {
    await Geolocator.requestPermission();
    await Geolocator.isLocationServiceEnabled();
    await Future.delayed(const Duration(seconds: 3));
    Position? position = await Geolocator.getCurrentPosition();
    return position;
  }
}
