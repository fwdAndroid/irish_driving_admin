import 'package:flutter/material.dart';
import 'package:irish_driving_admin/widgets/colors.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Registered Users",
            style: TextStyle(color: colorWhite),
          ),
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return const Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/pic.png"),
                    ),
                    trailing: Text(
                      "View",
                      style: TextStyle(color: mainColor, fontSize: 15),
                    ),
                    title: Text(
                      "FawadKaleem",
                      style: TextStyle(color: colorBlack, fontSize: 16),
                    ),
                    subtitle: Text(
                      "245 B Eden Garden Lahore",
                      style: TextStyle(
                          color: colorBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Divider()
                ],
              );
            }),
        backgroundColor: colorWhite);
  }
}
