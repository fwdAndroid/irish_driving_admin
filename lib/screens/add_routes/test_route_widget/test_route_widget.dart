import 'package:flutter/material.dart';
import 'package:irish_driving_admin/widgets/buttons.dart';
import 'package:irish_driving_admin/widgets/colors.dart';
import 'package:irish_driving_admin/widgets/textfield.dart';

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
    bool isLoading = false;

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
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
