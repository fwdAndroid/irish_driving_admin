import 'package:flutter/material.dart';
import 'package:irish_driving_admin/screens/add_routes/test_route_widget/test_route_widget.dart';
import 'package:irish_driving_admin/widgets/colors.dart';

class AddTestRoutes extends StatefulWidget {
  const AddTestRoutes({super.key});

  @override
  State<AddTestRoutes> createState() => _AddTestRoutesState();
}

class _AddTestRoutesState extends State<AddTestRoutes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: colorWhite),
        backgroundColor: mainColor,
        elevation: 2,
        centerTitle: true,
        title: const Text(
          "Add Test Centers",
          style: TextStyle(
            color: colorWhite,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/logo.png",
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Note:",
                style: TextStyle(
                    color: colorBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "On this page, we add our test centers, including their details and locations. This allows users to easily select the nearest location for test drives and driving lessons.",
                style: TextStyle(
                    color: colorBlack,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            ),
          ),
          TestRouteWidget()
        ],
      ),
    );
  }
}
