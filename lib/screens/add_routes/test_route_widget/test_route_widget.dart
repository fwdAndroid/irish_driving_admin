import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:irish_driving_admin/constant.dart';
import 'package:irish_driving_admin/screens/dashboard/main_screen.dart';
import 'package:irish_driving_admin/widgets/buttons.dart';
import 'package:irish_driving_admin/widgets/colors.dart';
import 'package:irish_driving_admin/widgets/controllers.dart';
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
  bool isLoading = true;
  String selectedPlace = '';
  Prediction? startPredictionA,
      startPredictionB,
      startPredictionC,
      startPredictionD,
      startPredictionE,
      startPredictionF,
      startPredictionG,
      startPredictionH;
  PlacesDetailsResponse? startResponseA,
      startResponseB,
      startResponseC,
      startResponseD,
      startResponseE,
      startResponseF,
      startResponseG,
      startResponseH;
  GeoPoint? startGeoPointA,
      startGeoPointB,
      startGeoPointC,
      startGeoPointD,
      startGeoPointE,
      startGeoPointF,
      startGeoPointG,
      startGeoPointH;

  String location = 'Please move map to A specific location.';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              controller: testCenterName,
              hintText: "Add Test Route Name",
              textInputType: TextInputType.text),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Add Test Route Start Location Point A",
            style: TextStyle(
                color: colorBlack, fontSize: 15, fontWeight: FontWeight.w700),
          ),
          TextFormInputField(
              onTap: () async {
                startPredictionA = await PlacesAutocomplete.show(
                  context: context,
                  apiKey: googleKey,
                );

                if (startPredictionA != null) {
                  // Save the selected place description for display purposes
                  setState(() {
                    addLocationA.text = startPredictionA!.description!;
                  });
                }
              },
              controller: addLocationA,
              hintText: "Test Route Point A",
              textInputType: TextInputType.text),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Add Test Route Start Location Point B",
            style: TextStyle(
                color: colorBlack, fontSize: 15, fontWeight: FontWeight.w700),
          ),
          TextFormInputField(
              onTap: () async {
                startPredictionB = await PlacesAutocomplete.show(
                  context: context,
                  apiKey: googleKey,
                );

                if (startPredictionB != null) {
                  // Save the selected place description for display purposes
                  setState(() {
                    addLocationB.text = startPredictionB!.description!;
                  });
                }
              },
              controller: addLocationB,
              hintText: "Test Route Point B",
              textInputType: TextInputType.text),
          SizedBox(
            height: 10,
          ),
          //Point C
          const Text(
            "Add Test Route Start Location Point C",
            style: TextStyle(
                color: colorBlack, fontSize: 15, fontWeight: FontWeight.w700),
          ),
          TextFormInputField(
              onTap: () async {
                startPredictionC = await PlacesAutocomplete.show(
                  context: context,
                  apiKey: googleKey,
                );

                if (startPredictionC != null) {
                  // Save the selected place description for display purposes
                  setState(() {
                    addLocationC.text = startPredictionC!.description!;
                  });
                }
              },
              controller: addLocationC,
              hintText: "Test Route Point C",
              textInputType: TextInputType.text),
          SizedBox(
            height: 10,
          ),
          //Point D
          const Text(
            "Add Test Route Start Location Point D",
            style: TextStyle(
                color: colorBlack, fontSize: 15, fontWeight: FontWeight.w700),
          ),
          TextFormInputField(
              onTap: () async {
                startPredictionD = await PlacesAutocomplete.show(
                  context: context,
                  apiKey: googleKey,
                );

                if (startPredictionD != null) {
                  // Save the selected place description for display purposes
                  setState(() {
                    addLocationD.text = startPredictionD!.description!;
                  });
                }
              },
              controller: addLocationD,
              hintText: "Test Route Point D",
              textInputType: TextInputType.text),
          SizedBox(
            height: 10,
          ),
          //Point E
          const Text(
            "Add Test Route Start Location Point E",
            style: TextStyle(
                color: colorBlack, fontSize: 15, fontWeight: FontWeight.w700),
          ),
          TextFormInputField(
              onTap: () async {
                startPredictionE = await PlacesAutocomplete.show(
                  context: context,
                  apiKey: googleKey,
                );

                if (startPredictionE != null) {
                  // Save the selected place description for display purposes
                  setState(() {
                    addLocationE.text = startPredictionE!.description!;
                  });
                }
              },
              controller: addLocationE,
              hintText: "Test Route Point E",
              textInputType: TextInputType.text),
          SizedBox(
            height: 10,
          ),
          //Point F
          const Text(
            "Add Test Route Start Location Point F",
            style: TextStyle(
                color: colorBlack, fontSize: 15, fontWeight: FontWeight.w700),
          ),
          TextFormInputField(
              onTap: () async {
                startPredictionF = await PlacesAutocomplete.show(
                  context: context,
                  apiKey: googleKey,
                );

                if (startPredictionF != null) {
                  // Save the selected place description for display purposes
                  setState(() {
                    addLocationF.text = startPredictionF!.description!;
                  });
                }
              },
              controller: addLocationF,
              hintText: "Test Route Point F",
              textInputType: TextInputType.text),
          SizedBox(
            height: 10,
          ),
          //Point G
          const Text(
            "Add Test Route Start Location Point G",
            style: TextStyle(
                color: colorBlack, fontSize: 15, fontWeight: FontWeight.w700),
          ),
          TextFormInputField(
              onTap: () async {
                startPredictionG = await PlacesAutocomplete.show(
                  context: context,
                  apiKey: googleKey,
                );

                if (startPredictionG != null) {
                  // Save the selected place description for display purposes
                  setState(() {
                    addLocationG.text = startPredictionG!.description!;
                  });
                }
              },
              controller: addLocationG,
              hintText: "Test Route Point G",
              textInputType: TextInputType.text),

          SizedBox(
            height: 10,
          ),
          //Point H
          const Text(
            "Add Test Route Start Location Point H",
            style: TextStyle(
                color: colorBlack, fontSize: 15, fontWeight: FontWeight.w700),
          ),
          TextFormInputField(
              onTap: () async {
                startPredictionH = await PlacesAutocomplete.show(
                  context: context,
                  apiKey: googleKey,
                );

                if (startPredictionH != null) {
                  // Save the selected place description for display purposes
                  setState(() {
                    addLocationH.text = startPredictionH!.description!;
                  });
                }
              },
              controller: addLocationH,
              hintText: "Test Route Point H",
              textInputType: TextInputType.text),

          JoinButton(
              title: "Add",
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                _savePlaceToFirestore();
                setState(() {
                  isLoading = false;
                });
                showSnakBar("Test Center Added Successfully", context);

                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => MainScreen()));
              })
        ],
      ),
    );
  }

  Future<void> _savePlaceToFirestore() async {
    GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: googleKey);
    String postId = Uuid().generateV4();

    // // PointA
    startResponseA =
        await places.getDetailsByPlaceId(startPredictionA!.placeId!);
    if (startResponseA!.status == "OK" &&
        startResponseA!.result.geometry != null) {
      double latitude = startResponseA!.result.geometry!.location.lat;
      double longitude = startResponseA!.result.geometry!.location.lng;

      startGeoPointA = GeoPoint(latitude, longitude);

      //Point B
      startResponseB =
          await places.getDetailsByPlaceId(startPredictionB!.placeId!);
      if (startResponseB!.status == "OK" &&
          startResponseB!.result.geometry != null) {
        double latitude = startResponseB!.result.geometry!.location.lat;
        double longitude = startResponseB!.result.geometry!.location.lng;
        startGeoPointB = GeoPoint(latitude, longitude);

        //Point C
        startResponseC =
            await places.getDetailsByPlaceId(startPredictionC!.placeId!);
        if (startResponseC!.status == "OK" &&
            startResponseC!.result.geometry != null) {
          double latitude = startResponseC!.result.geometry!.location.lat;
          double longitude = startResponseC!.result.geometry!.location.lng;
          startGeoPointC = GeoPoint(latitude, longitude);

          //Point D
          startResponseD =
              await places.getDetailsByPlaceId(startPredictionD!.placeId!);
          if (startResponseD!.status == "OK" &&
              startResponseD!.result.geometry != null) {
            double latitude = startResponseD!.result.geometry!.location.lat;
            double longitude = startResponseD!.result.geometry!.location.lng;
            startGeoPointD = GeoPoint(latitude, longitude);
            //Point E
            startResponseE =
                await places.getDetailsByPlaceId(startPredictionE!.placeId!);
            if (startResponseE!.status == "OK" &&
                startResponseE!.result.geometry != null) {
              double latitude = startResponseE!.result.geometry!.location.lat;
              double longitude = startResponseE!.result.geometry!.location.lng;
              startGeoPointE = GeoPoint(latitude, longitude);
              //Point F
              startResponseF =
                  await places.getDetailsByPlaceId(startPredictionF!.placeId!);
              if (startResponseF!.status == "OK" &&
                  startResponseF!.result.geometry != null) {
                double latitude = startResponseF!.result.geometry!.location.lat;
                double longitude =
                    startResponseF!.result.geometry!.location.lng;
                startGeoPointF = GeoPoint(latitude, longitude);

                //Point G
                startResponseG = await places
                    .getDetailsByPlaceId(startPredictionG!.placeId!);
                if (startResponseG!.status == "OK" &&
                    startResponseG!.result.geometry != null) {
                  double latitude =
                      startResponseG!.result.geometry!.location.lat;
                  double longitude =
                      startResponseG!.result.geometry!.location.lng;
                  startGeoPointG = GeoPoint(latitude, longitude);
                  //Point H
                  startResponseH = await places
                      .getDetailsByPlaceId(startPredictionH!.placeId!);
                  if (startResponseH!.status == "OK" &&
                      startResponseH!.result.geometry != null) {
                    double latitude =
                        startResponseH!.result.geometry!.location.lat;
                    double longitude =
                        startResponseH!.result.geometry!.location.lng;
                    startGeoPointH = GeoPoint(latitude, longitude);

                    await FirebaseFirestore.instance
                        .collection('centers')
                        .doc(postId)
                        .set({
                      "uuid": postId,
                      "locationPointA": startPredictionA!.description!,
                      "locationPointB": startPredictionB!.description!,
                      "locationPointC": startPredictionC!.description!,
                      "locationPointD": startPredictionD!.description!,
                      "locationPointE": startPredictionE!.description!,
                      "locationPointF": startPredictionF!.description!,
                      "locationPointG": startPredictionG!.description!,
                      "locationPointH": startPredictionH!.description!,
                      "startGeoPointA": startGeoPointA,
                      "startGeoPointB": startGeoPointB,
                      "startGeoPointC": startGeoPointC,
                      "startGeoPointD": startGeoPointD,
                      "startGeoPointE": startGeoPointE,
                      "startGeoPointF": startGeoPointF,
                      "startGeoPointG": startGeoPointG,
                      "startGeoPointH": startGeoPointH,
                      "geopoint": [
                        startGeoPointA,
                        startGeoPointB,
                        startGeoPointC,
                        startGeoPointD,
                        startGeoPointE,
                        startGeoPointF,
                        startGeoPointG,
                        startGeoPointH
                      ],
                      "centerName": testCenterName.text,
                    });
                  } else {
                    // Handle error
                    print("Error fetching place details");
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
