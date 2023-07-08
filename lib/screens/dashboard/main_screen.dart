import 'package:flutter/material.dart';
import 'package:irish_driving_admin/screens/dashboard/dashboard_page.dart';
import 'package:irish_driving_admin/screens/dashboard/routes_page.dart';
import 'package:irish_driving_admin/screens/dashboard/settings_page.dart';
import 'package:irish_driving_admin/screens/dashboard/user_details.dart';
import 'package:irish_driving_admin/widgets/colors.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = const [
    DashboardPage(),
    RoutesPage(),
    UserDetails(),
    SettingsPage(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DashboardPage(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        DashboardPage(); // if user taps on this dashboard tab will be active
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.dashboard,
                      color: currentTab == 0 ? colorGreen : colorBlack,
                    ),
                    Text(
                      "Dashboard",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
              //Routes
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = RoutesPage();
                    // if user taps on this dashboard tab will be active
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.route,
                      color: currentTab == 1 ? colorGreen : colorBlack,
                    ),
                    Text(
                      "Routes",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),

              //UsersList
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = UserDetails();
                    // if user taps on this dashboard tab will be active
                    currentTab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: currentTab == 2 ? colorGreen : colorBlack,
                    ),
                    Text(
                      "Users",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),

              ///Settings
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        SettingsPage(); // if user taps on this dashboard tab will be active
                    currentTab = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.settings,
                      color: currentTab == 3 ? colorGreen : colorBlack,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
