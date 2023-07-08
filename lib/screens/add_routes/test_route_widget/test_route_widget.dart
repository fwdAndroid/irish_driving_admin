import 'package:flutter/material.dart';
import 'package:irish_driving_admin/screens/dashboard/main_screen.dart';
import 'package:irish_driving_admin/services/database.dart';
import 'package:irish_driving_admin/widgets/buttons.dart';
import 'package:irish_driving_admin/widgets/colors.dart';
import 'package:irish_driving_admin/widgets/textfield.dart';
import 'package:irish_driving_admin/widgets/utils.dart';

class TestRouteWidget extends StatefulWidget {
  const TestRouteWidget({super.key});

  @override
  State<TestRouteWidget> createState() => _TestRouteWidgetState();
}

class _TestRouteWidgetState extends State<TestRouteWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController addTestRoute = TextEditingController();
    TextEditingController addTestLocation = TextEditingController();
    bool isLoading = true;

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
            "Add Test Center Location",
            style: TextStyle(
                color: colorBlack, fontSize: 15, fontWeight: FontWeight.w700),
          ),
          TextFormInputField(
              controller: addTestLocation,
              hintText: "Add Test Center Location",
              textInputType: TextInputType.text),
          const SizedBox(
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
                DataBaseMethods()
                    .addCenters(addTestRoute.text, addTestLocation.text);
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
