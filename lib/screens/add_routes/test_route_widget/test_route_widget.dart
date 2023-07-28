import 'package:flutter/material.dart';
import 'package:irish_driving_admin/screens/dashboard/main_screen.dart';
import 'package:irish_driving_admin/services/database.dart';
import 'package:irish_driving_admin/widgets/buttons.dart';
import 'package:irish_driving_admin/widgets/colors.dart';
import 'package:irish_driving_admin/widgets/textfield.dart';
import 'package:irish_driving_admin/widgets/utils.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';

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
  String googleApikey = "AIzaSyBffT8plN_Vdcd308KgmzIfGVQN6q-CkAo";
  bool _isLoading = false;
  bool loading = false;
  List latlong = [];

  String location = 'Please move map to A specific location.';

  @override
  void initState() {
    addTestLocation.text = "Select Start Test Route";
    addTestEndLocation.text = "Select End Test Route";
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
                var place = await PlacesAutocomplete.show(
                    context: context,
                    apiKey: googleApikey,
                    mode: Mode.overlay,
                    types: [],
                    strictbounds: false,
                    //google_map_webservice package
                    onError: (err) {
                      print(err);
                    });

                if (place != null) {
                  setState(() {
                    location = place.description.toString();
                    addTestLocation.text = location;
                  });
                }
                ;
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
                var place = await PlacesAutocomplete.show(
                    context: context,
                    apiKey: googleApikey,
                    mode: Mode.overlay,
                    types: [],
                    strictbounds: false,
                    onError: (err) {
                      print(err);
                    });

                if (place != null) {
                  setState(() {
                    location = place.description.toString();
                    addTestEndLocation.text = location;
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
                showSnakBar("Test Location is Required", context);
              } else {
                setState(() {
                  isLoading = true;
                });
                DataBaseMethods().addCenters(addTestRoute.text,
                    addTestLocation.text, addTestEndLocation.text);
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
    );
  }
}
