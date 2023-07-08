import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:irish_driving_admin/screens/auth_screen/login_screen.dart';
import 'package:irish_driving_admin/screens/notification/noti.dart';
import 'package:irish_driving_admin/widgets/colors.dart';
import 'package:irish_driving_admin/widgets/dialog.dart';
import 'package:irish_driving_admin/widgets/utils.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mainColor,
        centerTitle: true,
        title: const Text(
          "Account",
          style: TextStyle(color: colorWhite),
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage("assets/logo.png"),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: mainColor,
            radius: 90,
            backgroundImage: AssetImage("assets/logo.png"),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (builder) => Noti()));
              },
              leading: Icon(Icons.notifications, color: Colors.black),
              title: const Text("Notifications"),
              trailing: const Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
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
              leading: Icon(Icons.logout_outlined, color: Colors.black),
              title: Text("Log out"),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
