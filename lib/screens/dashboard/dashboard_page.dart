import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:irish_driving_admin/screens/appointmentpage/user_appointment.dart';
import 'package:irish_driving_admin/screens/auth_screen/login_screen.dart';
import 'package:irish_driving_admin/screens/dashboard/routes_page.dart';
import 'package:irish_driving_admin/screens/dashboard/user_details.dart';
import 'package:irish_driving_admin/screens/notification/noti.dart';
import 'package:irish_driving_admin/widgets/dialog.dart';
import 'package:irish_driving_admin/widgets/utils.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/logo.png',
          height: 150,
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false, // user must tap button!

                    context: context,
                    builder: (BuildContext context) {
                      return Dialogs(
                        title: "Logout\n\nAre you sure to logout the account?",
                        fl: [
                          TextButton(
                              onPressed: () async {
                                FirebaseAuth.instance.signOut().then((value) =>
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                LoginScreen())));

                                showSnakBar("LogOut", context);
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(color: Colors.black),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "No",
                                style: TextStyle(color: Colors.black),
                              ))
                        ],
                      );
                    });
              },
              icon: Icon(
                Icons.logout_sharp,
                color: Colors.green,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const RoutesPage()));
                },
                child: Container(
                  width: 150,
                  height: 210,
                  child: Card(
                    elevation: 5,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/service.png'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Routes',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              // ignore: sized_box_for_whitespace
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => UserAppointment()));
                },
                child: Container(
                  width: 150,
                  height: 210,
                  child: Card(
                    elevation: 5,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/deadline.png'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Appointments',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => UserDetails()));
                },
                child: Container(
                  width: 150,
                  height: 210,
                  child: Card(
                    elevation: 5,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/discount.png'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Subscribed Users',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (builder) => Noti()));
                },
                child: Container(
                  width: 150,
                  height: 210,
                  child: Card(
                    elevation: 5,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/notification.png'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Notifications',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
