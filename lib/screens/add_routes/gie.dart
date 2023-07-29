import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_maps_webservice/places.dart';

class MapScreenActivity extends StatefulWidget {
  @override
  _MapScreenActivityState createState() => _MapScreenActivityState();
}

class _MapScreenActivityState extends State<MapScreenActivity> {
  String selectedPlace = '';
  String googleApikey = "AIzaSyBffT8plN_Vdcd308KgmzIfGVQN6q-CkAo";

  void _selectPlace() async {
    // Show the PlacesAutocomplete widget to allow the user to select a location
    Prediction? prediction = await PlacesAutocomplete.show(
      context: context,
      apiKey: googleApikey,
    );

    if (prediction != null) {
      // Save the selected place description for display purposes
      setState(() {
        selectedPlace = prediction.description!;
      });

      // Convert the selected place to a Geopoint and store it in Firestore
      _savePlaceToFirestore(prediction);
    }
  }

  Future<void> _savePlaceToFirestore(Prediction prediction) async {
    // Get the details of the selected place using Google Maps Web Service
    GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: googleApikey);
    PlacesDetailsResponse response =
        await places.getDetailsByPlaceId(prediction.placeId!);
    if (response.status == "OK" && response.result.geometry != null) {
      double latitude = response.result.geometry!.location.lat;
      double longitude = response.result.geometry!.location.lng;

      // Create a Geopoint object
      GeoPoint geoPoint = GeoPoint(latitude, longitude);

      // Store the Geopoint in Firestore
      await FirebaseFirestore.instance.collection('locations').add({
        'name': prediction.description,
        'geopoint': geoPoint,
      });
    } else {
      // Handle error
      print("Error fetching place details");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PlacesAutocomplete Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selected Place: $selectedPlace'),
            ElevatedButton(
              onPressed: _selectPlace,
              child: Text('Select Place'),
            ),
          ],
        ),
      ),
    );
  }
}
