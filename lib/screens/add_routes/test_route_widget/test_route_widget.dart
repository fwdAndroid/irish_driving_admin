import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:irish_driving_admin/constant.dart';
import 'package:irish_driving_admin/screens/dashboard/main_screen.dart';
import 'package:irish_driving_admin/widgets/buttons.dart';
import 'package:irish_driving_admin/widgets/colors.dart';
import 'package:irish_driving_admin/widgets/textfield.dart';
import 'package:irish_driving_admin/widgets/utils.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:place_picker/uuid.dart';

class TestRouteWidget extends StatefulWidget {
  const TestRouteWidget({super.key});

  @override
  State<TestRouteWidget> createState() => _TestRouteWidgetState();
}

class _TestRouteWidgetState extends State<TestRouteWidget> {
  TextEditingController addTestRoute = TextEditingController();
  TextEditingController addTestLocation = TextEditingController();
  TextEditingController addTestEndLocation = TextEditingController();
  bool isLoading = true;
  String selectedPlace = '';
  Prediction? startPrediction;
  Prediction? endPrediction;
  PlacesDetailsResponse? endResponse;
  PlacesDetailsResponse? startResponse;
  GeoPoint? startGeoPoint;
  GeoPoint? endGeoPoint;

  String location = 'Please move map to A specific location.';

  @override
  void initState() {
    addTestLocation.text = "Select Start Test Route";
    addTestEndLocation.text = "Select End Test Route";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Add Test Center Name",
              style: TextStyle(
                  color: colorBlack, fontSize: 15, fontWeight: FontWeight.w700),
            ),
            TextFormInputField(
                controller: addTestRoute,
                hintText: "Add Test Route Name",
                textInputType: TextInputType.text),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Add Test Route Start Location",
              style: TextStyle(
                  color: colorBlack, fontSize: 15, fontWeight: FontWeight.w700),
            ),
            TextFormInputField(
                onTap: () async {
                  startPrediction = await PlacesAutocomplete.show(
                    context: context,
                    apiKey: googleKey,
                  );

                  if (startPrediction != null) {
                    // Save the selected place description for display purposes
                    setState(() {
                      addTestLocation.text = startPrediction!.description!;
                    });
                  }
                },
                controller: addTestLocation,
                hintText: "Add Test Center Location",
                textInputType: TextInputType.text),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Add Test Route End Location",
              style: TextStyle(
                  color: colorBlack, fontSize: 15, fontWeight: FontWeight.w700),
            ),
            TextFormInputField(
                onTap: () async {
                  endPrediction = await PlacesAutocomplete.show(
                    context: context,
                    apiKey: googleKey,
                  );

                  if (endPrediction != null) {
                    // Save the selected place description for display purposes
                    setState(() {
                      addTestEndLocation.text = endPrediction!.description!;
                    });
                  }
                },
                controller: addTestEndLocation,
                hintText: "Add Test End Route Location",
                textInputType: TextInputType.text),
            SizedBox(
              height: 10,
            ),
            JoinButton(
              title: "Add",
              onPressed: () async {
                setState(() {});
                if (addTestRoute.text.isEmpty && addTestLocation.text.isEmpty) {
                  showSnakBar(
                      "Test Location And Center Name is Required", context);
                } else if (addTestRoute.text.isEmpty) {
                  showSnakBar("Test Center Name is Required", context);
                } else if (addTestLocation.text.isEmpty) {
                  showSnakBar("Start Test Location is Required", context);
                } else if (addTestEndLocation.text.isEmpty) {
                  showSnakBar(
                      "End Test Location Location is Required", context);
                } else {
                  setState(() {
                    isLoading = true;
                  });
                  _savePlaceToFirestore(startPrediction!, endPrediction!);
                  setState(() {
                    isLoading = false;
                  });
                  showSnakBar("Test Center Added Successfully", context);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => MainScreen()));
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> _savePlaceToFirestore(Prediction start, Prediction end) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: googleKey);
    String postId = Uuid().generateV4();

    //End Point
    endResponse = await places.getDetailsByPlaceId(endPrediction!.placeId!);
    if (endResponse!.status == "OK" && endResponse!.result.geometry != null) {
      double latitude = endResponse!.result.geometry!.location.lat;
      double longitude = endResponse!.result.geometry!.location.lng;

      endGeoPoint = GeoPoint(latitude, longitude);

      //Start Point
      startResponse =
          await places.getDetailsByPlaceId(startPrediction!.placeId!);
      if (startResponse!.status == "OK" &&
          startResponse!.result.geometry != null) {
        double latitude = startResponse!.result.geometry!.location.lat;
        double longitude = startResponse!.result.geometry!.location.lng;
        startGeoPoint = GeoPoint(latitude, longitude);

        await FirebaseFirestore.instance.collection('centers').doc(postId).set({
          "testLocation": startPrediction!.description!,
          'centerEndLocation': endPrediction!.description,
          'endGeoPoint': endGeoPoint,
          "startGeoPoint": startGeoPoint,
          "geopoint": [startGeoPoint, endGeoPoint],
          "centerName": addTestRoute.text
        });
      } else {
        // Handle error
        print("Error fetching place details");
      }
    }
  }
}
