import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LocationSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Save Location to Firestore')),
        body: Center(
          child: LocationSelectionWidget(),
        ),
      ),
    );
  }
}

class LocationSelectionWidget extends StatefulWidget {
  @override
  State<LocationSelectionWidget> createState() =>
      _LocationSelectionWidgetState();
}

class _LocationSelectionWidgetState extends State<LocationSelectionWidget> {
  String googleApikey = "AIzaSyBffT8plN_Vdcd308KgmzIfGVQN6q-CkAo";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(),
        ElevatedButton(
          onPressed: () async {
            // Show the PlacesAutocomplete widget to get location details
            Prediction? prediction = await PlacesAutocomplete.show(
              context: context,
              apiKey: googleApikey, // Replace with your API key
              mode: Mode.overlay,
              language: "en",
              components: [Component(Component.country, "us")],
            );

            if (prediction != null) {
              // Get the details for the selected place
              GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: googleApikey);
              PlacesDetailsResponse detail =
                  await places.getDetailsByPlaceId(prediction.placeId!);

              // Save the latitude and longitude to Firestore
              saveLocationToFirestore(detail.result.geometry!.location.lat,
                  detail.result.geometry!.location.lng);
            }
          },
          child: Text("Select Location"),
        ),
      ],
    );
  }

  void saveLocationToFirestore(double latitude, double longitude) {
    // Replace "locations" with the name of your Firestore collection
    CollectionReference locationsRef =
        FirebaseFirestore.instance.collection('locations');

    // Create a new document with a generated ID and save the latitude and longitude
    locationsRef.add({
      'latitude': latitude,
      'longitude': longitude,
    }).then((value) {
      print(
          "Location saved to Firestore: Latitude: $latitude, Longitude: $longitude");
    }).catchError((error) {
      print("Error saving location: $error");
    });
  }
}
